jQuery(document).ready(function()
{

    function restoreRow(oTable, nRow) {
        var aData = oTable.fnGetData(nRow);
        var jqTds = $('>td', nRow);

        for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
            oTable.fnUpdate(aData[i], nRow, i, false);
        }

        oTable.fnDraw();
    }

    var table = $('#sample_editable_1');

    var oTable = table.dataTable({
        "lengthMenu": [
            [5, 15, 20, -1],
            [5, 15, 20, "All"] // change per page values here
        ],
        // set the initial value
        "pageLength": 10,
        "select":true,
        "responsive":true,
        "language": {
            "lengthMenu": " _MENU_ records"
        }, dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        "columnDefs": [{ // set default column settings
            'orderable': true,
            'targets': [0]
        }, {
            "searchable": true,
            "targets": [0]
        }],
        "order": [
            [0, "asc"]
        ] // set first column as a default sort by asc
    });

    var tableWrapper = $("#sample_editable_1_wrapper");

    tableWrapper.find(".dataTables_length select").select2({
        showSearchInput: false //hide search box with special css class
    }); // initialize select2 dropdown

    var nEditing = null;
    var nNew = false;

    $('#sample_editable_1_new').click(function (e) {
        e.preventDefault();

        if (nNew && nEditing) {
            if (confirm("Previose row not saved. Do you want to save it ?")) {
                saveRow(oTable, nEditing); // save
                $(nEditing).find("td:first").html("Untitled");
                nEditing = null;
                nNew = false;

            } else {
                oTable.fnDeleteRow(nEditing); // cancel
                nEditing = null;
                nNew = false;

                return;
            }
        }

        var aiNew = oTable.fnAddData(['', '', '', '', '', '']);
        var nRow = oTable.fnGetNodes(aiNew[0]);
        editRow(oTable, nRow);
        nEditing = nRow;
        nNew = true;
    });

    table.on('click', '.status', function (e) {
        e.preventDefault();
        if (nEditing !== null && nEditing != nRow) {
               /* Get the row as a parent of the link that was clicked on */
               var nRow = $(this).parents('tr')[0];

               if (nEditing !== null && nEditing != nRow) {
                   /* Currently editing - but not this row - restore the old before continuing to edit mode */
                   $('#editConfirmModal').modal();
               } else if (nEditing == nRow && this.innerHTML == "Save") {
                   /* Editing this row and want to save it */
                   saveRow(oTable, nEditing);
                   nEditing = null;
                   $('#saveConfirmModal').modal();
               }
           }
           else {
               /*if (confirm("Are you sure to delete this row ?") == false) {
                return;
                }*/

               /* $('button.btnDelete').on('click', function (e) {
                e.preventDefault();
                var id = $(this).closest('tr').data('id');
                $('#myModal').data('id', id).modal('show');
                });

                $('#btnDelteYes').click(function () {
                var id = $('#myModal').data('id');
                $('[data-id=' + id + ']').remove();
                $('#myModal').modal('hide');
                });*/

               var status = $('.status').data('status');

               if (status == 1) {
                   console.log("click 1");
                  // table.reload(); // success
               } else {
                    console.log("click 2");
                   // table.reload(); // success
               }


               /*$('#deleteConfirmModal').modal({ backdrop: 'static', keyboard: false })
                .one('click', '#delete_item', function (e) {
                // var aiNew = oTable.fnAddData(['', '', '', '', '', '']);
                var nRow = oTable.fnGetNodes();
                console.log(nRow);
                oTable.fnDeleteRow(nRow[0]);

                });*/
           }
    });

    table.on('click', '.delete', function(e) {
        e.preventDefault();

        if (nEditing !== null && nEditing != nRow) {
            /* Get the row as a parent of the link that was clicked on */
            var nRow = $(this).parents('tr')[0];

            if (nEditing !== null && nEditing != nRow) {
                /* Currently editing - but not this row - restore the old before continuing to edit mode */
                $('#editConfirmModal').modal();
            } else if (nEditing == nRow && this.innerHTML == "Save") {
                /* Editing this row and want to save it */
                saveRow(oTable, nEditing);
                nEditing = null;
                $('#saveConfirmModal').modal();
            }
        }
        else {
            /*if (confirm("Are you sure to delete this row ?") == false) {
             return;
             }*/

            /* $('button.btnDelete').on('click', function (e) {
             e.preventDefault();
             var id = $(this).closest('tr').data('id');
             $('#myModal').data('id', id).modal('show');
             });

             $('#btnDelteYes').click(function () {
             var id = $('#myModal').data('id');
             $('[data-id=' + id + ']').remove();
             $('#myModal').modal('hide');
             });*/

            var id = $(this).closest('tr').data('id');
            $('#user_list_deleteConfirmModal').data('id', id).modal('show');


            $('#user_list_delete_item').click(function () {
                var id = $('#user_list_deleteConfirmModal').data('id');
                $('[data-id=' + id + ']').remove();
                // ajax
                $('#user_list_deleteConfirmModal').modal('hide'); // success
            });


            /*$('#deleteConfirmModal').modal({ backdrop: 'static', keyboard: false })
             .one('click', '#delete_item', function (e) {
             // var aiNew = oTable.fnAddData(['', '', '', '', '', '']);
             var nRow = oTable.fnGetNodes();
             console.log(nRow);
             oTable.fnDeleteRow(nRow[0]);

             });*/
        }
    });

    table.on('click', '.cancel', function (e) {
        e.preventDefault();

        if (nNew) {
            oTable.fnDeleteRow(nEditing);
            nNew = false;
        } else {
            restoreRow(oTable, nEditing);
            nEditing = null;
        }
    });

    table.on('click', '.edit', function (e) {
        e.preventDefault();

        /* Get the row as a parent of the link that was clicked on */
        var nRow = $(this).parents('tr')[0];

        if (nEditing !== null && nEditing != nRow) {
            /* Currently editing - but not this row - restore the old before continuing to edit mode */
            $('#editConfirmModal').modal();
        } else if (nEditing == nRow && this.innerHTML == "Save") {
            /* Editing this row and want to save it */
            saveRow(oTable, nEditing);
            nEditing = null;
            $('#saveConfirmModal').modal();
        } else {
            /* No edit in progress - let's start one */
            editRow(oTable, nRow);
            nEditing = nRow;
        }
    });

});