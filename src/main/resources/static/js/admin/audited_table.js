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

    var table1 = $('#pending_review_table_1');

    var oTable = table1.dataTable({
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
            'csv', 'print'
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

    var tableWrapper1 = $("#pending_review_table_1_wrapper");

    tableWrapper1.find(".dataTables_length select").select2({
        showSearchInput: false //hide search box with special css class
    }); // initialize select2 dropdown

    table1.on('click', '.delete', function(e) {
        e.preventDefault();

        var id = $(this).closest('tr').data('id');
        var tr_ele = $(this).closest('tr');

        $('#deleteConfirmModal_1').data('id', id).modal('show');


        $('#delete_item_1').click(function () {
            var id = $('#deleteConfirmModal_1').data('id');
            $.post("/admin/del-group", {id: id},
                function (result) {
                    if (result.status) {
                        tr_ele.remove();

                        $('#deleteConfirmModal_1').modal('hide');
                    } else {
                        $('#deleteConfirmModal_1').modal('hide');

                        swal("警告", "删除失败。", "warning");
                    }
                }
            );
        });
    });

    // table 2
    var table2 = $('#pending_review_table_2');

    var oTable = table2.dataTable({
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
            'csv', 'print'
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

    var tableWrapper2 = $("#pending_review_table_2_wrapper");

    tableWrapper2.find(".dataTables_length select").select2({
        showSearchInput: false //hide search box with special css class
    }); // initialize select2 dropdown

    table2.on('click', '.delete', function(e) {
        e.preventDefault();

        var id = $(this).closest('tr').data('id');
        var tr_ele = $(this).closest('tr');
        $('#deleteConfirmModal_2').data('id', id).modal('show');


        $('#delete_item_2').click(function () {
            var id = $('#deleteConfirmModal_2').data('id');
            $.post("/admin/---", {id: id},
                function (result) {
                    if (result.status) {
                        tr_ele.remove();

                        $('#deleteConfirmModal_2').modal('hide');
                    } else {
                        $('#deleteConfirmModal_2').modal('hide');

                        swal("警告", "删除失败。", "warning");
                    }
                }
            );
        });
    });

    table2.on('click', '.cancel', function (e) {
        e.preventDefault();

    });

    //table 3
    var table3 = $('#pending_review_table_3');

    var oTable = table3.dataTable({
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
            'csv', 'print'
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

    var tableWrapper3 = $("#pending_review_table_3_wrapper");

    tableWrapper3.find(".dataTables_length select").select2({
        showSearchInput: false //hide search box with special css class
    }); // initialize select2 dropdown

    table3.on('click', '.delete', function(e) {
        e.preventDefault();

        var id = $(this).closest('tr').data('id');
        var tr_ele = $(this).closest('tr');
        $('#deleteConfirmModal_3').data('id', id).modal('show');


        $('#delete_item_3').click(function () {
            var id = $('#deleteConfirmModal_3').data('id');
            $.post("/admin/---", {id: id},
                function (result) {
                    if (result.status) {
                        tr_ele.remove();

                        $('#deleteConfirmModal_3').modal('hide');
                    } else {
                        $('#deleteConfirmModal_3').modal('hide');

                        swal("警告", "删除失败。", "warning");
                    }
                }
            );
        });
    });

    table3.on('click', '.cancel', function (e) {
        e.preventDefault();

    });
});