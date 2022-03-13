<header class="header-v2">
    <!-- Header desktop -->
    <div class="container-menu-desktop trans-03">
        <div class="wrap-menu-desktop">
            <nav class="limiter-menu-desktop p-l-45">
                
                <!-- Logo desktop -->		
                <a href="/" class="logo">
                    <h1>SHOP</h1>
                </a>
                <!-- Menu desktop -->
                <div class="menu-desktop">
                    <ul class="main-menu">
                        <li>
                            <a href="/">Home</a>
                        </li>
                        {!! \App\Helpers\Helper::categories_home($categories) !!}
                    </ul>
                </div>	

                <!-- Icon header -->
                <div class="wrap-icon-header flex-w flex-r-m h-full">    
                    <div class="flex-c-m h-full p-l-18 p-r-25 bor5">
                        <div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart" data-notify="2">
                            <a href="/carts"><i class="zmdi zmdi-shopping-cart"></i></a>
                        </div>
                    </div>
            </nav>
        </div>	
    </div>
</header>
