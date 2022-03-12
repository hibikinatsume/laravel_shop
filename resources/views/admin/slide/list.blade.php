@extends('admin.main')

@section('content')
    <table class="table table-bordered">
        <thead>
            <tr>
                <th style="width: 10px">#</th>
                <th>Tên Slide</th>
                <th>Link</th>
                <th>Hình ảnh</th>
                <th>Thứ tự</th>
                <th>Tình trạng</th>
                <th style="width: 100px"></th>
            </tr>
        </thead>
        <tbody>
            @foreach ($slides as $key => $slide)
                <tr>
                    <td>{{ $slide->id }}</td>
                    <td>{{ $slide->name }}</td>
                    <td>{{ $slide->url }}</td>
                    <td><a href="{{$slide->thumb }}" target="_blank"><img src="{{ $slide->thumb }}" width="100px"></a></td>
                    <td>{{ $slide->sort_by }}</td>
                    <td>{!! \App\Helpers\Helper::active($slide->active) !!}</td>
                    <td>
                        <span onclick="remove({{$slide->id}}, '/admin/slide/destroy')" class="icon-delete"><i class="icon-tools fas fa-trash fa-lg"></i></span>
                        <a href="/admin/slide/edit/{{$slide->id}}" class="icon-edit"><span><i class="icon-tools fas fa-tasks fa-lg"></i></span></a>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
