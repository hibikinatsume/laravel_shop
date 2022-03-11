$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

function remove(id, url) {
    if (confirm('Bạn có chắc muốn xóa?')) {
        $.ajax({
            type: 'POST',
            datatype: 'JSON',
            data: { id },
            url: url,
            success: function (result) {
                console.log(result);
                if (result.error === false) {
                    location.reload();
                }
            }
        })
    }
}