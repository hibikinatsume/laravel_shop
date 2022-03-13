<!DOCTYPE html>
<html lang="en">

<head>
    @include('head')
</head>

<body class="animsition_123">

    <!-- Header -->
    @include('header')

    @yield('content')

    <!-- Back to top -->
    <div class="btn-back-to-top" id="myBtn">
        <span class="symbol-btn-back-to-top">
            <i class="zmdi zmdi-chevron-up"></i>
        </span>
    </div>

    @include('footer')
</body>

</html>
