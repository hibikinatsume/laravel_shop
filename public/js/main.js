$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

/*remove*/
function remove(id, url) {
    if (confirm('Bạn có chắc muốn xóa?')) {
        $.ajax({
            type: 'POST',
            datatype: 'JSON',
            data: { id },
            url: url,
            success: function(result) {
                console.log(result);
                if (result.error === false) {
                    location.reload();
                }
            }
        })
    }
}

/*upload files*/
$(document).ready(function() {
    $('#upload').change(function() {
        const form = new FormData();
        form.append('file', $(this)[0].files[0]);

        $.ajax({
            processData: false,
            contentType: false,
            type: 'POST',
            dataType: 'JSON',
            data: form,
            url: '/admin/upload/services',
            success: function(result) {
                if (result.error === false) {
                    $('#image_show').html('<a href="' + result.url + '" target="_blank">' + '<img src="' + result.url + '" width="100px"></a>');

                    $('#file').val(result.url);
                } else {
                    alert('Upload file lỗi');
                }
            }
        });
    })
})

/*load more*/
function loadMore() {
    let page = $('#page').val();
    $.ajax({
        type: 'POST',
        datatype: 'JSON',
        data: { page },
        url: '/services/load-product',
        success: function(result) {
            if (result.html != '') {
                $('#loadProduct').append(result.html);
                $('#page').val(page + 1)
            } else {
                alert('Hết sản phẩm');
                $('#btn-pagin').css('display', 'none');
            }
        }
    })
}