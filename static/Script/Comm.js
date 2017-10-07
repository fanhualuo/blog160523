function upload(btn, show, type, action, fun) {
    var load = new AjaxUpload($('#' + btn), {
        action: action,
        type: "POST",
        data: {},
        responseType: "json",
        autoSubmit: true,
        name: 'UploadFile',
        onChange: function (file, ext) {
            $('#' + show).html('正在上传...');
        },
        onSubmit: function (file, ext) {
            if (type == 'image') {
                if (!(ext && /^(png|jpeg|jpg|gif)$/.test(ext))) {
                    $('#' + show).html('<span style="color:red;">错误：无效的文件扩展名！</span>');
                    return false;
                }
            } else if (type == "file") {
                if (!(ext && /^(zip|rar)$/.test(ext))) {
                    $('#' + show).html('<span style="color:red;">错误：无效的文件扩展名！</span>');
                    return false;
                }
            }
        }, //jpg|png|jpeg|gif
        onComplete: fun
    });
}