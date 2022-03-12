@extends('admin.main')

@section('content')
    <table class="table table-bordered">
        <thead>
            <tr>
                <th style="width: 10px">#</th>
                <th>Tên sản phẩm</th>
                <th>Giá sản phẩm</th>
                <th>Giá khuyến mãi</th>
                <th>Danh mục</th>
                <th>Tình trạng</th>
                <th style="width: 100px"></th>
            </tr>
        </thead>
        <tbody>
            @foreach ($products as $key => $product)
                <tr>
                    <td>{{ $product->id }}</td>
                    <td>{{ $product->name }}</td>
                    <td>{{ $product->price }}</td>
                    <td>{{ $product->price_sale }}</td>
                    <td>{{ $product->category->name }}</td>
                    <td>{!! \App\Helpers\Helper::active($product->active) !!}</td>
                    <td>
                        <span onclick="remove({{$product->id}}, '/admin/product/destroy')" class="icon-delete"><i class="icon-tools fas fa-trash fa-lg"></i></span>
                        <a href="/admin/product/edit/{{$product->id}}" class="icon-edit"><span><i class="icon-tools fas fa-tasks fa-lg"></i></span></a>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
