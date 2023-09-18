<div class="row" style="position:relative;bottom:1px;">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <label class="card-title">
                    <ul class="navbar-nav ml-auto left">
                        <li class="nav-item dropdown user-menu">
                            <form action="{{ route('CheckDocument.ShowDocument') }}" method="post">
                                @csrf
                                <div class="form-group">
                                    <table>
                                        <tr>
                                            <td style="position:relative;top:3px;"><label>Document Number</label></td>
                                            <td>
                                                <div class="input-group">
                                                    <input id="businessDocument_RefID" style="border-radius:0;" name="businessDocument_RefID" type="text" class="form-control" hidden value="{{ $businessDocument['recordID'] }}">
                                                    <input id="businessDocumentNumber" style="border-radius:0;" name="businessDocumentNumber" type="text" class="form-control" value="{{ $businessDocument['number'] }}" autocomplete="off">
                                                    <div class="input-group-append">
                                                        <span style="border-radius:0;" class="input-group-text form-control">
                                                            <a class="nav-link mySearchCheckDocument" data-toggle="modal" data-target="#mySearchCheckDocument"><img src="{{ asset('AdminLTE-master/dist/img/box.png') }}" width="13" alt=""></a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td style="padding-left: 20px;;">
                                                <div class="input-group">
                                                    <button class="btn btn-default btn-sm float-right" type="submit">
                                                        <img src="{{ asset('AdminLTE-master/dist/img/backwards.png') }}" width="13" alt="" title="Show"> &nbsp; Show
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </form>
                        </li>
                    </ul>
                </label>
            </div>
        </div>
    </div>
</div>