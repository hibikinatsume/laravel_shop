@extends('main')

@section('content')
    <!-- Slider -->
    @include('slide')
    <section class="bg0 p-t-23 p-b-140">
        <div class="container">
            <div class="p-b-10 m-b-10">
                <h3 class="ltext-103 cl5 title-list">
                    Tất cả sản phẩm
                </h3>
            </div>
            <!-- Product -->
            @include('list')

            <!-- Load more -->
            <div class="flex-c-m flex-w w-full p-t-45 " id="btn-pagin">
                <input type="hidden" value="1" id="page">
                <a class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04" onclick="loadMore()">
                    XEM THÊM
                </a>
            </div>
        </div>
    @endsection
