<div id="myWorker" class="modal fade" role="dialog" aria-labelledby="ModalScrollableTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <label class="card-title">Select Worker</label>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body table-responsive p-0" style="height: 400px;">
                                <table class="table table-head-fixed text-nowrap" id="tableGetWorker">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Position</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function() {
        $('.myWorker').on('click', function(e) {
            e.preventDefault();
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                type: 'GET',
                url: '{!! route("getWorker") !!}',
                success: function(data) {
                    var no = 1;
                    var t = $('#tableGetWorker').DataTable();
                    t.clear();
                    $.each(data, function(key, val) {
                        t.row.add([
                            '<tbody><tr><td>' + no++ + '</td>',
                            '<td><span data-dismiss="modal" onclick="klikWorker(\'' + val.sys_ID + '\', \'' + val.personName + '\', \'' + val.organizationalJobPositionName + '\');">' + val.sys_ID + '</span></td>',
                            '<td style="border:1px solid #e9ecef;">' + val.personName + '</td>',
                            '<td style="border:1px solid #e9ecef;">' + val.organizationalJobPositionName + '</td></tr></tbody>',
                        ]).draw();
                    });
                }
            });
        });
    });
</script>

<script>
    function klikWorker(id, name, position) {
        $("#request_name_id").val(id);
        $("#request_name").val(name);
        $("#request_position").val(position);
        $("#contactPhone").val(id);
    }
</script>