<div id="mySearchPr" class="modal fade" role="dialog" aria-labelledby="contohModalScrollableTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <label class="card-title">Choose No Trans</label>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <table>
                            <tr>
                                <td><label>No Trans</label></td>
                                <td>
                                    <div class="input-group">
                                        <input autocomplete="off" style="border-radius:0;" type="text" class="form-control" id="trano_no_po" onkeyup="searchTranoNoPo()">
                                        <br><br><br>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td><label>Project Code</label></td>
                                <td>
                                    <div class="input-group">
                                        <input autocomplete="off" style="border-radius:0;" type="text" class="form-control" id="project_code_po" onkeyup="searchProjectCodePo()">
                                        <br><br><br>
                                    </div>
                                </td>
                                <td><label>Site Code</label></td>
                                <td>
                                    <div class="input-group">
                                        <input autocomplete="off" style="border-radius:0;" type="text" class="form-control" id="site_code_po" onkeyup="searchSiteCodePo()">
                                        <br><br><br>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><label>Origin of Budget</label></td>
                                <td>
                                    <div class="input-group">
                                        <select class="form-control select2bs4" style="width: 100%; border-radius:0;">
                                            <option selected="selected">OPEX</option>
                                            <option>CAPEX</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body table-responsive p-0" style="height: 400px;">
                                <table class="table table-head-fixed text-nowrap" id="poTable">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Trano</th>
                                            <th>Origin of Budget</th>
                                            <th>Project ID</th>
                                            <th>Project Name</th>
                                            <th>Site Code</th>
                                            <th>Site Name</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php $no=1; @endphp
                                        @for($i = 1; $i < 4; $i++) <tr>
                                            <td>
                                                <span class="tag tag-success">
                                                    <p data-dismiss="modal">{{ $no++ }}</p>
                                                </span>
                                            </td>
                                            <td>
                                                <span class="tag tag-success">
                                                    <p data-dismiss="modal" class="klikSearchArf" data-id="Q00018{{ $i }}">Q00018{{$i}}</p>
                                                </span>
                                            </td>
                                            <td>
                                                <span class="tag tag-success">
                                                    <p data-dismiss="modal" class="klikSearchArf" data-id="brfp_no {{ $i }}">Origin of Budget {{$i}}</p>
                                                </span>
                                            </td>
                                            <td>
                                                <span class="tag tag-success">
                                                    <p data-dismiss="modal" class="klikSearchArf" data-id="project_id {{ $i }}">Project ID {{$i}}</p>
                                                </span>
                                            </td>
                                            <td>
                                                <span class="tag tag-success">
                                                    <p data-dismiss="modal" class="klikSearchArf" data-id="project_name {{ $i }}">Project Name {{$i}}</p>
                                                </span>
                                            </td>
                                            <td>
                                                <span class="tag tag-success">
                                                    <p data-dismiss="modal" class="klikSearchArf" data-id="site_code {{ $i }}" data-name="site_name {{ $i }}">Site Code {{$i}}</p>
                                                </span>
                                            </td>
                                            <td>
                                                <p>Site Name {{$i}}</p>
                                            </td>
                                            </tr>
                                            @endfor
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
<!--|----------------------------------------------------------------------------------|
    |                            End Function My Project Code                          |
    |----------------------------------------------------------------------------------|-->
<script>
    function searchTranoNoPo() {
        // Declare variables
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("trano_no_po");
        filter = input.value.toUpperCase();
        table = document.getElementById("poTable");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    function searchProjectCodePo() {
        // Declare variables
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("project_code_po");
        filter = input.value.toUpperCase();
        table = document.getElementById("poTable");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[3];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    function searchSiteCodePo() {
        // Declare variables
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("site_code_po");
        filter = input.value.toUpperCase();
        table = document.getElementById("poTable");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[5];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>

<script>
    $(function() {
        $(".klikSearchArf").on('click', function(e) {
            e.preventDefault(); // in chase you change to a link or button
            var $this = $(this);
            var code = $this.data("id");
            var name = $this.data("name");
            $("#managerUid").val(code);
            $("#managerName").val(name);
            $("#headerPrNumber").val(code);
            $("#searchDorNumberRevision").val(code);

            $(".tableArfDetail").show();

            //Batas

            $("#arfNumberAsf").prop("disabled", true);

            $("#requester").val("requester 1");
            $("#managerAsfUid").val("Manager 1");
            $("#managerAsfName").val("Manager Detail 1");
            $("#currency").val("IDR");
            $("#financeArfUid").val("finance 1");
            $("#financeArfName").val("Finance Detail 1");
            $("#remark").val("Remark 1");
            $("#total").val("100000");
            $("#totalDetail").val("Rp");

            //End batas
            
            var datas = [];

            for (var i = 1; i <= x; i++) {
                var data = {
                    origin_budget: "x",
                    projectcode: "x",
                    projectname: "x",
                    sitecode: "x",
                    sitecode2: "x",
                    beneficiary: "x",
                    bank_name: "x",
                    account_name: "x",
                    account_number: "x",
                    internal_notes: "x",
                    requestNameArf: "x",
                    putWorkId: "x",
                    putWorkName: "x",
                    putProductId: "x",
                    putProductName: "x",
                    putQty: "x",
                    putQtys: "x",
                    putUom: "x",
                    putPrice: "x",
                    putCurrency: "x",
                    totalArfDetails: "x",
                    putRemark: "x",
                    filenames: "x",
                }
                datas.push(data);
            }

            var json_object = JSON.stringify(datas);
            // console.log(json_object);

            $.ajax({
                type: "POST",
                url: '{{route('ARF.store')}}',
                data: json_object,
                contentType: "application/json",
                processData: true,
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                success: function(data) {
                    y++;
                    $.each(data, function(key, val) {
                        $('#tablePrDetailDor').append('<tr id="control-group"><td><center><a class="btn btn-outline-success btn-rounded btn-sm" style="border-radius: 100px;" href="javascript:buttonPlus()"><i class="fa fa-plus"></i></a></center></td><td><span id="lastWorkId_' + y + '">' + val.putWorkId + '</span></td><td><span id="lastWorkName_' + y + '">' + val.putWorkName + '</span></td><td><span id="lastProductId_' + y + '">' + val.putProductId + '</span></td><td><span id="lastProductName_' + y + '">' + val.putProductName + '</span></td><td><span id="lastRemark_' + y + '">' + val.putRemark + '</span></td><td><span id="lastUom_' + y + '">' + val.putUom + '</span></td><td><span id="lastPrice_' + y + '">' + val.putPrice + '</span></td><td><span id="totalArfDetails_' + y + '">' + val.totalArfDetails + '</span></td><td><span id="lastCurrency_' + y + '">' + val.putCurrency + '</span></td><td><span id="lastRemark_' + y + '">' + val.putRemark + '</span></td></tr>');
                    });
                },
                error: function(data) {
                    Swal.fire("Error !", "Data Gagal Ditambahkan", "error");
                }
            });
        });
    });
</script>

<script>
    function buttonPlus() {
        $("#detailDor").show();
        $("#prNumberDorDetail").val("x");
        $("#projectDorDetail").val("x");
        $("#projectDorDetail2").val("x");
        $("#siteDorDetail").val("x");
        $("#siteDorDetail2").val("x");
        $("#workIdDorDetail").val("x");
        $("#workIdDorDetail2").val("x");
        $("#productIdDorDetail").val("x");
        $("#productIdDorDetail2").val("x");
        $("#priceDorDetail").val("x");
        $("#averageDorDetail").val("x");
        $("#qtyDorDetail").val("x");
        $("#qtyDorDetail2").val("x");
        $("#discountDorDetail").val("x");
        $("#discountDorDetail2").val("x");
        $("#afterDiscountDorDetail").val("x");
        $("#prQty").val("x");
        $("#inDorQty").val("x");
        $("#balanceQty").val("x");
        $("#newBalanceQty").val("x");
    }
</script>