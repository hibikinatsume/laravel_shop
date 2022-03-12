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
                            <label>Tên sản phẩm</label>
                            <input type="text" class="form-control" placeholder="Nhập tên sản phẩm..." name="name" value="{{ old('name') }}">
                        </div>
                    </div>
                </div>
                <!-- ./name -->
                <!-- category -->
                <div class="row">
                    <div class="col-sm-12">
                        <!-- select -->
                        <div class="form-group">
                            <label>Chọn danh mục</label>
                            <select class="form-control" name="category_id">
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <!-- ./category -->
                <!-- description -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>Mô tả sản phẩm</label>
                            <textarea class="form-control" rows="3" placeholder="Nhập mô tả sản phẩm..." name="desc">{{ old('name') }}</textarea>
                        </div>
                    </div>
                </div>
                <!-- ./description-->
                <!-- content -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>Nội dung sản phẩm</label>
                            <textarea class="form-control" rows="3" id="editorproduct" name="content" >{{ old('name') }}</textarea>
                        </div>
                    </div>
                </div>
                <!-- ./content -->
                <!-- thumb -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>Hình ảnh sản phẩm: </label>
                            <input type="file" id="upload" name="file">
                            <div id="image_show"></div>
                            <input type="hidden" name="file" id="file">
                        </div>
                    </div>
                </div>
                <!-- ./thumb -->
                 <!-- price -->
                 <div class="row">
                    <div class="col-sm-12">
                        <!-- text input -->
                        <div class="form-group">
                            <label>Giá gốc</label>
                            <input type="text" class="form-control" placeholder="Nhập giá gốc..." name="price" value="{{ old('price') }}">
                        </div>
                    </div>
                </div>
                <!-- ./price -->
                 <!-- price_sale -->
                 <div class="row">
                    <div class="col-sm-12">
                        <!-- text input -->
                        <div class="form-group">
                            <label>Giá khuyến mãi</label>
                            <input type="text" class="form-control" placeholder="Nhập giá khuyến mãi..." name="price_sale" value="{{ old('price_sale') }}">
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
                                <input class="form-check-input" type="radio" name="active" checked="" value="1">
                                <label class="form-check-label">Có</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="active" value="0">
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
