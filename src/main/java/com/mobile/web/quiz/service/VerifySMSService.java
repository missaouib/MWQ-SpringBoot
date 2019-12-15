package com.mobile.web.quiz.service;

import com.mobile.web.quiz.model.VerifySMS;
import com.mobile.web.quiz.repository.VerifySMSRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class VerifySMSService {
    private static final long SMS_TIMEOUT = 60; // second

    public enum ResultVerifySMS {
        OK,
        Expired,
        NotExist
    }

    @Autowired
    private VerifySMSRepository repository;

    public void add(VerifySMS entity) {
        repository.save(entity);
    }

    public void delete(long id) {
        repository.deleteById(id);
    }

    public void deleteByPhoneNumber(String phoneNumber) {
        List<VerifySMS> entities = repository.findByPhoneNumber(phoneNumber);
        for(VerifySMS entity : entities) {
            repository.deleteById(entity.getId());
        }
    }

    public boolean canRegisterPhoneNumber(String phoneNumber)  {
        List<VerifySMS> entities = repository.findByPhoneNumberAndExpiredOrderByCreatedAtDesc(phoneNumber, true);

        return entities.isEmpty();
    }

    public ResultVerifySMS checkSMSCode(String phoneNumber, String code) {
        List<VerifySMS> entities = repository.findByPhoneNumberAndExpiredOrderByCreatedAtDesc(phoneNumber, false);
        if (entities.isEmpty())
            return ResultVerifySMS.NotExist;
        else {
            boolean isValid = false;

            for(VerifySMS item : entities){
                if (item.getCode().equals(code)) {
                    Date created = item.getCreatedAt();
                    Date now = new Date();
                    long seconds = (now.getTime()-created.getTime())/1000;

                    isValid = seconds < SMS_TIMEOUT;
                    break;
                }
            }

            if (isValid) {
                for(VerifySMS item : entities){
                    item.setExpired(true);
                    repository.save(item);
                }
            }

            return isValid ? ResultVerifySMS.OK : ResultVerifySMS.Expired;
        }
    }
}