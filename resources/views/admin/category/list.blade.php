@extends('admin.main')

@section('content')
{!! \App\Helpers\Helper::categories($categories) !!}
@endsection
