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
                            <label>Tên danh mục</label>
                            <input type="text" class="form-control" placeholder="Nhập tên danh mục..." name="name" value="{{ $category->name }}">
                        </div>
                    </div>
                </div>
                <!-- ./name -->
                <!-- parent -->
                <div class="row">
                    <div class="col-sm-12">
                        <!-- select -->
                        <div class="form-group">
                            <label>Chọn danh mục</label>
                            <select class="form-control" name="parent">
                                <option value="0"{{ $category->parent_id == 0 ? 'selected' : ''}}>Danh mục</option>
                                @foreach ($categories as $categoryParent)
                                    <option value="{{ $categoryParent->id }}" {{ $category->parent_id == $categoryParent->id ? 'selected' : ''}}>{{ $categoryParent->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <!-- ./parent -->
                <!-- active -->
                <div class="row">
                    <div class="col-sm-12">
                        <!-- radio -->
                        <div class="form-group">
                            <label>Kích hoạt</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="active" value="1" {{ $category->active == 1 ? 'checked=""' : ''}}>
                                <label class="form-check-label">Có</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="active" value="0" {{ $category->active == 0 ? 'checked=""' : ''}}>
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
