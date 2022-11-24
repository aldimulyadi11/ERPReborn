<div class="card-body">
  <div class="row">
    <div class="col-md-8">
      <div class="form-group">
        <table>
          <tr>
            <td style="padding-top: 5px;"><label>Budget Code</label></td>
            <td>
              <div class="input-group" style="width: 70%;">
                <input id="projectcode" style="border-radius:0;" name="projectcode" class="form-control" readonly>
                <div class="input-group-append">
                  <span style="border-radius:0;" class="input-group-text form-control">
                    <a id="projectcode2" data-toggle="modal" data-target="#myProject" class="myProject"><img src="{{ asset('AdminLTE-master/dist/img/box.png') }}" width="13" alt=""></a>
                  </span>
                </div>
              </div>
            </td>
            <td>
              <div class="input-group" style="width: 153%;position:relative;right:38%;">
                <input id="projectname" style="border-radius:0;" class="form-control" name="projectname" readonly>
              </div>
            </td>
          </tr>
        </table>
      </div>
    </div>
    <div class="col-md-4">
      <div class="form-group">
        <table>
          <tr>
            <td style="padding-top: 5px;"><label>DOR Number</label></td>
            <td>
              <div class="input-group" style="width: 108%;">
                <input id="dor_number" style="border-radius:0;" name="var_dor_number" class="form-control" readonly>
                <div class="input-group-append">
                  <span style="border-radius:0;" class="input-group-text form-control">
                    <a id="dor_number2" data-toggle="modal" data-target="#mySearchDor  "><img src="{{ asset('AdminLTE-master/dist/img/box.png') }}" width="13" alt=""></a>
                  </span>
                </div>
              </div>
            </td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</div>