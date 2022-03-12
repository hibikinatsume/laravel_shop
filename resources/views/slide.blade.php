<section class="section-slide">
    <div class="wrap-slick1 rs1-slick1">
        <div class="slick1">
            @foreach ($slides as $slide)
                <div class="item-slick1" style="background-image: url({{ $slide->thumb }});">
                    <div class="container h-full">
                        <div class="flex-col-l-m h-full p-t-100 p-b-30">
                            <div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
                                <h2 class="ltext-104 cl2 p-t-19 p-b-43 respon1">
                                    {{ $slide->name }}
                                </h2>
                            </div>

                            <div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
                                <a href="product.html"
                                    class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
                                    XEM THÊM
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>