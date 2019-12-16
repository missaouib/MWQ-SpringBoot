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


    var table = $('#notice_list_table');

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
            "lengthMenu": " _MENU_ records",
            "emptyTable": "表中无可用数据。",
            "search": "搜索"
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

    table.on('click', '.delete', function(e) {
        e.preventDefault();

        var id = $(this).closest('tr').data('id');
        $('#deleteConfirmModal').data('id', id).modal('show');


        $('#delete_item').click(function () {
            var id = $('#deleteConfirmModal').data('id');

            $.post("/admin/del-notice", {id: id},
                function (result) {
                    if (result.status) {
                        $('[data-id=' + id + ']').remove();

                        $('#deleteConfirmModal').modal('hide');
                    } else {
                        $('#deleteConfirmModal').modal('hide');

                        swal("警告", "删除失败。", "warning");
                    }
                }
            );
        });
    });
});