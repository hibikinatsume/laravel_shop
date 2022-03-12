@extends('admin.main')

@section('content')
    <div class="card card-dark p-3">
        <!-- card-body -->
        <div class="card-body">
            @include('admin.alert')
            <form action="" method="POST">
                <!-- name -->
                <div class="row">
                    <div class="col-sm-12">
                        <!-- text input -->
                        <div class="form-group">
                            <label>Tên Slide</label>
                            <input type="text" class="form-control" placeholder="..." name="name" value="{{ $slide->name }}">
                        </div>
                    </div>
                </div>
                <!-- ./name -->
                <!-- thumb -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>Hình ảnh: </label>
                            <input type="file" id="upload" name="file">
                            <div id="image_show">
                                <a href="{{ $slide->thumb }}" target="_blank">
                                    <img src="{{ $slide->thumb }}" width="100px">
                                </a>
                            </div>
                            <input type="hidden" name="file" id="file" value="{{ $slide->thumb }}">
                        </div>
                    </div>
                </div>
                <!-- ./thumb -->
                 <!-- price -->
                 <div class="row">
                    <div class="col-sm-12">
                        <!-- text input -->
                        <div class="form-group">
                            <label>Link</label>
                            <input type="text" class="form-control" placeholder="..." name="url" value="{{ $slide->url }}">
                        </div>
                    </div>
                </div>
                <!-- ./price -->
                 <!-- price_sale -->
                 <div class="row">
                    <div class="col-sm-12">
                        <!-- text input -->
                        <div class="form-group">
                            <label>Sắp xếp</label>
                            <input type="number" class="form-control" placeholder="..." name="sort_by" value="{{ $slide->sort_by }}">
                        </div>
                    </div>
                </div>
                <!-- ./price_sale -->
                <!-- active -->
                <div class="row">
                    <div class="col-sm-12">
                        <!-- radio -->
                        <div class="form-group">
                            <label>Kích hoạt</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="active" value="1" {{ $slide->active == 1 ? 'checked=""' : ''}}>
                                <label class="form-check-label">Có</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="active" value="0" {{ $slide->active == 0 ? 'checked=""' : ''}}>
                                <label class="form-check-label">Không</label>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ./active -->
                <!-- button -->
                <div class="row">
                    <div class="col-12">
                        <button type="submit" class="btn btn-dark btn-block">Xác nhận</button>
                    </div>
                </div>
                <!-- ./button -->
                @csrf
            </form>
        </div>
        <!-- /.card-body -->
    </div>
@endsection
