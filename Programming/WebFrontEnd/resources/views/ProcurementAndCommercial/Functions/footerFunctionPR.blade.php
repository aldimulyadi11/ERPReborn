<!--  SHOW HIDE AVAILABEL -->
<script type="text/javascript">
    $(document).ready(function() {
        $(".available").hide();
        $("#detailprList").hide();
        $("#detailTransAvail").hide();
        $("#removeButton").hide();
    });
</script>
<!--  END SHOW HIDE AVAILABEL -->
<script type="text/javascript">
    $(document).ready(function() {
        $(".detailTransaction").click(function() {
            $("#arfTableDisableEnable").find("input,button,textarea,select").attr("disabled", false);
        });
    });
</script>
<script>
    $(document).ready(function() {
        $('.klikDetail1').click(function() {
            $("#arfTableDisableEnable").find("input,button,textarea,select").attr("disabled", true);
            $("#buttonPrList").prop("disabled", true);
            $(".available").show();
            $("#detailTransAvail").show();
            var get11 = $("#getWorkId1").html();
            var get21 = $("#getWorkName1").html();
            var get31 = $("#getProductId1").html();
            var get41 = $("#getQty1").html();
            var get51 = $("#getPrice1").html();
            var get61 = $("#getRemark1").html();
            var get71 = $("#getProductName1").html();
            var get81 = $("#getUom1").html();
            var get91 = $("#getCurrency1").html();
            var get101 = $("#getRequester1").html();
            var totalBOQ1 = get41 * get51;
            var totalBalance1 = totalBOQ1 - get101;
            $("#totalBalance").val(totalBalance1);
            $("#totalBOQ").val(totalBOQ1);
            $("#totalRequester").val(get101);
            $("#putWorkId").val(get11);
            $("#putWorkName").val(get21);
            $("#putProductId").val(get31);
            $("#putQty").val(get41);
            $("#putPrice").val(get51);
            $("#putRemark").val(get61);
            $("#putProductName").val(get71);
            $("#putUom").val(get81);
            $("#putCurrency").val(get91);
        });
        $('.klikDetail2').click(function() {
            $("#arfTableDisableEnable").find("input,button,textarea,select").attr("disabled", true);
            $("#buttonPrList").prop("disabled", true);
            $(".available").show();
            $("#detailTransAvail").show();
            var get12 = $("#getWorkId2").html();
            var get22 = $("#getWorkName2").html();
            var get32 = $("#getProductId2").html();
            var get42 = $("#getQty2").html();
            var get52 = $("#getPrice2").html();
            var get62 = $("#getRemark2").html();
            var get72 = $("#getProductName2").html();
            var get82 = $("#getUom2").html();
            var get92 = $("#getCurrency2").html();
            var get102 = $("#getRequester2").html();
            var totalBOQ2 = get42 * get52;
            var totalBalance2 = totalBOQ2 - get102;
            $("#totalBalance").val(totalBalance2);
            $("#totalBOQ").val(totalBOQ2);
            $("#totalRequester").val(get102);
            $("#putWorkId").val(get12);
            $("#putWorkName").val(get22);
            $("#putProductId").val(get32);
            $("#putQty").val(get42);
            $("#putPrice").val(get52);
            $("#putRemark").val(get62);
            $("#putProductName").val(get72);
            $("#putUom").val(get82);
            $("#putCurrency").val(get92);
        });
        $('.klikDetail3').click(function() {
            $("#arfTableDisableEnable").find("input,button,textarea,select").attr("disabled", true);
            $("#buttonPrList").prop("disabled", true);
            $(".available").show();
            $("#detailTransAvail").show();
            var get13 = $("#getWorkId3").html();
            var get23 = $("#getWorkName3").html();
            var get33 = $("#getProductId3").html();
            var get43 = $("#getQty3").html();
            var get53 = $("#getPrice3").html();
            var get63 = $("#getRemark3").html();
            var get73 = $("#getProductName3").html();
            var get83 = $("#getUom3").html();
            var get93 = $("#getCurrency3").html();
            var get103 = $("#getRequester3").html();
            var totalBOQ3 = get43 * get53;
            var totalBalance3 = totalBOQ3 - get103;
            $("#totalBalance").val(totalBalance3);
            $("#totalBOQ").val(totalBOQ3);
            $("#totalRequester").val(get103);
            $("#putWorkId").val(get13);
            $("#putWorkName").val(get23);
            $("#putProductId").val(get33);
            $("#putQty").val(get43);
            $("#putPrice").val(get53);
            $("#putRemark").val(get63);
            $("#putProductName").val(get73);
            $("#putUom").val(get83);
            $("#putCurrency").val(get93);
        });
        $('.klikDetail4').click(function() {
            $("#arfTableDisableEnable").find("input,button,textarea,select").attr("disabled", true);
            $("#buttonPrList").prop("disabled", true);
            $(".available").show();
            $("#detailTransAvail").show();
            var get14 = $("#getWorkId4").html();
            var get24 = $("#getWorkName4").html();
            var get34 = $("#getProductId4").html();
            var get44 = $("#getQty4").html();
            var get54 = $("#getPrice4").html();
            var get64 = $("#getRemark4").html();
            var get74 = $("#getProductName4").html();
            var get84 = $("#getUom4").html();
            var get94 = $("#getCurrency4").html();
            var get104 = $("#getRequester4").html();
            var totalBOQ4 = get44 * get54;
            var totalBalance4 = totalBOQ4 - get104;
            $("#totalBalance").val(totalBalance4);
            $("#totalBOQ").val(totalBOQ4);
            $("#totalRequester").val(get104);
            $("#putWorkId").val(get14);
            $("#putWorkName").val(get24);
            $("#putProductId").val(get34);
            $("#putQty").val(get44);
            $("#putPrice").val(get54);
            $("#putRemark").val(get64);
            $("#putProductName").val(get74);
            $("#putUom").val(get84);
            $("#putCurrency").val(get94);
        });
    });
</script>
<script>
    var x = 1, y = 0; //initlal text box count

    $('#buttonArfList').click(function () {

        $("#arfTableDisableEnable").find("input,button,textarea,select").attr("disabled", false);
        $("#detailArfList").show();
        var datas = [];

        for(var i=1; i<=x; i++){
            var data = {
                origin_budget: $('#origin_budget').val(),
                projectcode: $('#projectcode').val(),
                projectname: $('#projectname').val(),
                subprojectc: $('#subprojectc').val(),
                subprojectn: $('#subprojectn').val(),
                beneficiary: $('#beneficiary').val(),
                bank_name: $('#bank_name').val(),
                account_name: $('#account_name').val(),
                account_number: $('#account_number').val(),
                internal_notes: $('#internal_notes').val(),
                requestNameArf: $('#requestNameArf').val(),
                putWorkId: $('#putWorkId').val(),
                putWorkName: $('#putWorkName').val(),
                putProductId: $('#putProductId').val(),
                putProductName: $('#putProductName').val(),
                putQty: $('#qtyCek').val(),
                putUom: $('#putUom').val(),
                putPrice: $('#putPrice').val(),
                putCurrency: $('#putCurrency').val(),
                totalArfDetails: $('#totalArfDetails').val(),
                putRemark: $('#putRemark').val(),
                filenames: $('#filenames_' + i ).val(),
            }
            datas.push(data);
        }

        var json_object = JSON.stringify(datas);
        // console.log(json_object);

        $.ajax({                        
            type: "POST",
            url: '{{route("ARF.store")}}',
            data: json_object,
            contentType: "application/json",
            processData: true,
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            }
            , success: function(data){
                Swal.fire("Success !", "Data Berhasil Ditambahkan", "success");
                console.log(data);
                y++;
                $.each(data, function (key, val) {
                    $('#tableArfListCart').append('<tr id="control-group"><td><center><button class="btn btn-outline-danger btn-rounded btn-sm my-0 remove-val-list remove-attachment" style="border-radius: 100px;"><i class="fa fa-trash"></i></button></center></td><td><span id="lastWorkId_' + y + '">' + val.putWorkId + '</span></td><td><span id="lastWorkName_' + y + '">' + val.putWorkName + '</span></td><td><span id="lastProductId_' + y + '">' + val.putProductId + '</span></td><td><span id="lastProductName_' + y + '">' + val.putProductName + '</span></td><td><input name="qty" style="border-radius:0;width:50px;border:1px solid white;" type="text" class="form-control ChangeQtys" autocomplete="off" id="lastQty_' + y + '" value=' + val.putQty + '></td><td><span id="lastUom_' + y + '">' + val.putUom + '</span></td><td><span id="lastPrice_' + y + '">' + val.putPrice + '</span></td><td><span id="totalArfDetails_' + y + '">' + val.totalArfDetails + '</span></td><td><span id="lastCurrency_' + y + '">' + val.putCurrency + '</span></td><td><span id="lastRemark_' + y + '">' + val.putRemark + '</span></td></tr>');                    
                });
                
            },
            error: function(data) {
                Swal.fire("Error !", "Data Gagal Ditambahkan", "error");
            } 
        });
    });

    var wrapper = $(".input_fields_wrap"); //Fields wrapper
    $('.add_field_button').click(function () {
        cek = 0;
        addColomn();
    });
    function addColomn(){ //on add input button click
        if(cek == 0){
            cek++;
            x++; //text box increment
            $(wrapper).append(

                '<div class="col-md-12">'
                +   '<div class="form-group">'
                +       '<div class="input-group control-group" style="width:105%;position:relative;right:8px;">'
                +           '<input type="file" class="form-control filenames" id="filenames_' + x + '" style="height:26px;">'
                +           '<div class="input-group-btn">'
                +               '<button class="btn btn-outline-secondary btn-sm remove_field" type="button"><i class="glyphicon glyphicon-remove"></i> Remove</button>'
                +           '</div>'
                +       '</div>'
                +    '</div>'
                +'</div>'

            ); //add input box                
        }                        
    }

    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent().parent().parent('div').remove(); x--;
    })


</script>



<script>
    // var y = 1; //initlal text box count

    $('#saveArfList').click(function () {
        var datax = [];
        for(var i=1; i<=y; i++){
            var data = {
                lastWorkId: $('#lastWorkId_' + i ).html(),
                lastWorkName: $('#lastWorkName_' + i ).html(),
                lastProductId: $('#lastProductId_' + i ).html(),
                lastProductName: $('#lastProductName_' + i ).html(),
                lastQty: $('#lastQty_' + i ).val(),
                lastUom: $('#lastUom_' + i ).html(),
                lastPrice: $('#lastPrice_' + i ).html(),
                totalArfDetails: $('#totalArfDetails_' + i ).html(),
                lastCurrency: $('#lastCurrency_' + i ).html(),
                lastRemark: $('#lastRemark_' + i ).html(),
                
            }
            datax.push(data);
        }

        var json_object = JSON.stringify(datax);
        console.log(json_object);

        $.ajax({
            type: "POST",
            url: '{{route("ARF.tests")}}',
            data: json_object,
            contentType: "application/json",
            processData: true,
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            }
            , success: function(data){
                console.log(data);
            }, 
            error: function(data) {
                Swal.fire("Error !", "Data Gagal Ditambahkan", "error");
            } 
        });
    });
</script>


<script>
    $('document').ready(function() {
        $('.ChangeQty').keyup(function() {
            
            var qtyReq = $(this).val();
            if (qtyReq == 0 || qtyReq == '') {
                qtyReq = 0;
            }
            var putQty = parseFloat($('#putQty').val());
            var putPrice = parseFloat($('#putPrice').val());
            var total = parseFloat(putQty * putPrice);
            var total2 = parseFloat(qtyReq * putPrice);

            if (qtyReq == '') {
                $("#buttonArfList").prop("disabled", true);
            } else if (total2 > total) {
                Swal.fire("Error !", "Your Request Is Over Budget", "error");
                $("#buttonArfList").prop("disabled", true);
            } else {
                var totalReq = parseFloat(total2).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
                $('#totalArfDetails').val(totalReq);
                $("#buttonArfList").prop("disabled", false);
            }

        });
    });
</script>

<script>
    $('document').ready(function() {
        $('.ChangeQtys').keyup(function() {
            console.log('hello');
            
            var qtyReq = $(this).val();
            if (qtyReq == 0 || qtyReq == '') {
                qtyReq = 0;
            }
            var putQty = parseFloat($("#putQtybyId").val());
            var putPrice = parseFloat($('#arfListPrice').html());
            var total = parseFloat(putQty * putPrice);
            var total2 = parseFloat(qtyReq * putPrice);

            if (qtyReq == '') {
                $("#buttonArfList").prop("disabled", true);
                $("#saveArfList").prop("disabled", true);
            } else if (total2 > total) {
                Swal.fire("Error !", "Your Request Is Over Budget", "error");
                $("#saveArfList").prop("disabled", true);
            } else {
                var totalReq = parseFloat(total2).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
                $('#arfListTotal').html(totalReq);
                $("#saveArfList").prop("disabled", false);
            }

        });
    });
</script>


<script type="text/javascript">
    $(document).ready(function() {
        $("body").on("click", ".remove-attachment", function() {
            $(this).parents("#control-group").remove();
        });
    });
</script>



<script>
    $('document').ready(function() {
        $('.ChangeQty').keyup(function() {

        var qtyReq = $(this).val();
        if (qtyReq == 0 || qtyReq == '') {
            qtyReq = 0;
        }
        var putQty = parseFloat($('#putQty').val());
        var putPrice = parseFloat($('#putPrice').val());

        if (qtyReq == '') {
            $("#buttonPrList").prop("disabled", true);
        } else if (qtyReq > putQty) {
            alert("Your Request Is Over Budget");
            $("#buttonPrList").prop("disabled", true);
        } else {
            var totalReq = parseFloat(qtyReq) * parseFloat(putPrice);
            var totalReq = parseFloat(totalReq).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
            $('#totalprDetails').val(totalReq);
            $("#buttonPrList").prop("disabled", false);
        }

        });
    });
</script>
<script>
    $('document').ready(function() {
        $('.ChangeQtys').keyup(function() {

            var qtyReq = $(this).val();
            if (qtyReq == 0 || qtyReq == '') {
                qtyReq = 0;
            }
            var putQty = parseFloat($('#putQty').val());
            var putPrice = parseFloat($('#putPrice').val());

            if (qtyReq == '') {} else if (qtyReq > putQty) {
                alert("Your Request Is Over Budget");
            } else {
                var totalReq = parseFloat(qtyReq) * parseFloat(putPrice);
                var totalReq = parseFloat(totalReq).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
                $('#prListTotal').html(totalReq);
            }

        });
    });
</script>

<script>
    $(document).ready(function() {
        $('#buttonPrList').click(function() {
            $("#removeButton").show();
            $("#detailprList").show();
            var list1 = $("#putWorkId").val();
            var list2 = $("#putWorkName").val();
            var list3 = $("#putProductId").val();
            var list4 = $("#putProductName").val();
            var list5 = $("#qtyCek").val();
            var list6 = $("#putUom").val();
            var list7 = $("#putPrice").val();
            var list8 = $("#totalprDetails").val();
            var list9 = $("#putCurrency").val();
            var list10 = $("#putRemark").val();
            $("#prListWorkId").html(list1);
            $("#prListWorkName").html(list2);
            $("#prListProductId").html(list3);
            $("#prListProductName").html(list4);
            $("#prListQty").val(list5);
            $("#prListUom").html(list6);
            $("#prListPrice").html(list7);
            $("#prListTotal").html(list8);
            $("#prListCurrency").html(list9);
            $("#prListRemark").html(list10);
        });
    });
</script>

<script>
    $(document).ready(function() {
        $('.klikcek').click(function() {
            var list1 = $("#prListQty").val();
            alert(list1);
        });
    });
</script>