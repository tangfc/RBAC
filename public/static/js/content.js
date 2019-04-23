/*
 *
 *   H+ - 后台主题UI框架
 *   version 4.9
 *
*/

var $parentNode = window.parent.document;

function $childNode(name) {
    return window.frames[name]
}

// tooltips
// $('.tooltip-demo').tooltip({
//     selector: "[data-toggle=tooltip]",
//     container: "body"
// });

// 使用animation.css修改Bootstrap Modal
// $('.modal').appendTo("body");
//
// $("[data-toggle=popover]").popover();

//折叠ibox
$('.collapse-link').click(function () {
    var ibox = $(this).closest('div.ibox');
    var button = $(this).find('i');
    var content = ibox.find('div.ibox-content');
    content.slideToggle(200);
    button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
    ibox.toggleClass('').toggleClass('border-bottom');
    setTimeout(function () {
        ibox.resize();
        ibox.find('[id^=map-]').resize();
    }, 50);
});

//关闭ibox
$('.close-link').click(function () {
    var content = $(this).closest('div.ibox');
    content.remove();
});

//判断当前页面是否在iframe中
if (top == this) {
    var gohome = '<div class="gohome"><a class="animated bounceInUp" href="index.html?v=4.0" title="返回首页"><i class="fa fa-home"></i></a></div>';
    $('body').append(gohome);
}

//animation.css
function animationHover(element, animation) {
    element = $(element);
    element.hover(
        function () {
            element.addClass('animated ' + animation);
        },
        function () {
            //动画完成之前移除class
            window.setTimeout(function () {
                element.removeClass('animated ' + animation);
            }, 2000);
        });
}

//拖动面板
function WinMove() {
    var element = "[class*=col]";
    var handle = ".ibox-title";
    var connect = "[class*=col]";
    $(element).sortable({
        handle: handle,
        connectWith: connect,
        tolerance: 'pointer',
        forcePlaceholderSize: true,
        opacity: 0.8,
    })
        .disableSelection();
};

// 点击搜索按钮
$('#search').click(function () {
    $('#table').bootstrapTable('refresh');
});

// 操作成功返回上一层
var closeLayer = function () {
    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    parent.closeLayerAndRefresh(index);
}

// 点击返回
$('.closelayer').click(function (event) {
    closeLayer();
});

var closeLayerAndRefresh = function (index) {
    layer.close(index);
    $('#table').bootstrapTable('refresh', {silent: true});
}


// 条件筛选
$('#filter').on('click', function (event) {
    var text = $(this).find('span').text();
    if (text == '展开筛选') {
        $(this).find('span').text('收起筛选');
        $(this).find('i').removeClass('fa-angle-down').addClass('fa-angle-up');
    } else {
        $(this).find('span').text('展开筛选');
        $(this).find('i').removeClass('fa-angle-up').addClass('fa-angle-down');
    }
});

//  新增
var addLayer = function (url, direct = false, id) {
    if (false == direct) {
        $('#' + id).click(function () {
            event.preventDefault();
            layer.open({
                type: 2,
                title: false,
                closeBtn: false,
                area: ['100%', '100%'],
                shade: false,
                move: false,
                content: url
            });
        });
    } else {
        event.preventDefault();
        layer.open({
            type: 2,
            title: false,
            closeBtn: false,
            area: ['100%', '100%'],
            shade: false,
            move: false,
            content: url
        });
    }
};

// 删除
var deleteRecord = function (url, data, title = '您确定要删除吗', text = '删除后将无法恢复，请谨慎操作') {
    swal({
        title: title,
        text: text,
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "是的，我要确定！",
        cancelButtonText: "我再考虑一下…",
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function () {
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'json',
            data: data,
        }).done(function (cb) {
            if (cb.status == 1) {
                swal('操作成功', '', 'success');
                $('#table').bootstrapTable('refresh', {silent: true});
            } else {
                swal('操作失败', cb.info, 'error');
            }
        }).fail(function () {
            swal("操作失败！", "请重新操作！", "error");
        });
    })
};

// 表单条件
var queryParams = function (params = {}) {
    //这里的键的名字和控制器的变量名必须一致，这边改动，控制器也需要改成一样的
    var temp = {
        limit: params.limit,     // 页面大小
        offset: params.offset,  // 每页显示数据的开始行号
        sort: params.sort,       // 排序列名
        order: params.order,    // 排位命令（desc，asc）
    };
    temp = $.extend(temp, params);
    return temp;
};

// table页面初始化
var initBootstrapTable = function (id, url, pagination = true) {
    $('#' + id + '').bootstrapTable({
        url: url,                               //请求后台的URL（*）
        method: 'get',                           //请求方式（*）
        toolbar: '#toolbar',                    //工具按钮用哪个容器
        striped: true,                          //是否显示行间隔色
        cache: true,                           //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: pagination,                      //是否显示分页（*）
        sortable: true,                         //是否启用排序
        sortOrder: "desc",                      //排序方式
        sidePagination: "server",               //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                           //初始化加载第一页，默认第一页,并记录
        pageSize: 15,                             //每页的记录行数（*）
        pageList: [15, 30, 45, 60, 75, 90],        //可供选择的每页的行数（*）
        search: false,                            //是否显示表格搜索
        strictSearch: true,                      // 是否严格搜索
        showColumns: false,                     //是否显示所有的列（选择显示的列）
        showRefresh: false,                     //是否显示刷新按钮
        minimumCountColumns: 2,                 //最少允许的列数
        clickToSelect: true,                    //是否启用点击选中行
        // height: ,                            //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
        showToggle: false,                   //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        detailView: false,                  //是否显示父子表
        columns: [],
        queryParams: queryParams,
        onLoadSuccess: function () {  //加载成功时执行
            console.info("加载成功");
        },
        onLoadError: function () {  //加载失败时执行
            console.info("加载数据失败");
        }
    });
};

// 时间搜索
var searchByTime = function (stime = '', etime = '', restrict = false) {
    var id = '';
    if (stime.length != 0 && etime != 0) {
        id = '#' + stime + ',' + '#' + 'etime';
    } else if (stime.length != 0 && etime == 0) {
        id = '#' + stime;
        restrict = false;
    } else if (stime.length == 0 && etime != 0) {
        id = '#' + etime;
        restrict = false;
    }
    $(id).datetimepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd hh:ii',
        weekStart: 1, //一周从哪一天开始。0（星期日）到6（星期六）
        startView: 2, // 日期时间选择器打开之后首先显示的视图  默认值：2, 'month'
        minView: 0, // 日期时间选择器所能够提供的最精确的时间选择视图  默认值：0, 'hour'
        todayHighlight: true,
        todayBtn: true,
        autoclose: true
    });
    if (true == restrict) {
        $('#' + stime).on('changeDate', function (event) {
            $('#' + etime).datetimepicker('setStartDate', event.date);
        });
        $('#' + etime).on('changeDate', function (event) {
            $('#' + stime).datetimepicker('setEndDate', event.date);
        });
    }
};


// 图片上传
var uploaderInit = function (url = '',pick = "#filePicker",filePicker = "#filePicker", fileHidden = "#fileHidden") {
    var uploader = WebUploader.create({
        // 选完文件后，是否自动上传。
        auto: true,
        // swf文件路径
        swf: '/static/webuploader-0.1.5/Uploader.swf',
        // 文件接收服务端。
        server: url,

        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: pick,

        // 只允许选择图片文件。
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        }
    });
    // 文件上传成功
    uploader.on('uploadSuccess', function (file, cb) {
        if (cb.status == 1) {
            $(filePicker).find('img').attr('src', cb['data']['origin']);
            $(fileHidden).val( JSON.stringify(cb.data) )
        } else {
            swal('上传图片失败', cb.info, 'error');
        }
    });
};

var uploaderInit2 = function (url = '',pick = "#filePicker",filePicker = "#filePicker", fileHidden = "#fileHidden") {
    var uploader = WebUploader.create({
        // 选完文件后，是否自动上传。
        auto: true,
        // swf文件路径
        swf: '/static/webuploader-0.1.5/Uploader.swf',
        // 文件接收服务端。
        server: url,

        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: pick,

        // 只允许选择图片文件。
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        }
    });
    // 文件上传成功
    uploader.on('uploadSuccess', function (file, cb) {
        if (cb.status == 1) {
            $(filePicker).find('img').attr('src', cb['data']['origin']);
            $(fileHidden).val( JSON.stringify(cb.data) )
        } else {
            swal('上传图片失败', cb.info, 'error');
        }
    });
};

// 提交表单
var subnitForm = function (id = 'editForm', refresh = false, style = 'help-block', ok = "<i class='glyphicon glyphicon-ok'></i> " + " 验证通过") {
    var form = $('#' + id).Validform({
        btnSubmit: '#btn-submit',
        postonce: false,
        showAllError: true,
        //msg：提示信息;
        //o:{obj:*,type:*,curform:*}, obj指向的是当前验证的表单元素（或表单对象），type指示提示的状态，值为1、2、3、4， 1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态, curform为当前form对象;
        //cssctl:内置的提示信息样式控制函数，该函数需传入两个参数：显示提示信息的对象 和 当前提示的状态（既形参o中的type）;
        tiptype: function (msg, o) {
            if (!o.obj.is('form')) {
                //验证表单元素时o.obj为该表单元素，全部验证通过提交表单时o.obj为该表单对象;
                var B = o.obj.parents('.form-group');
                var T = B.find('.' + style);
                if (o.type == 2) {
                    B.removeClass('has-error').addClass('has-success');
                    T.html(ok);
                } else {
                    B.removeClass('has-success').addClass('has-error');
                    T.html("<i class='glyphicon glyphicon-remove'></i> " + msg);
                }
            }
        },
        ajaxPost: true,
        callback: function (cb) {
            if (cb.status == 1) {
                if (refresh == false) {
                    parent.swal('操作成功', '', 'success');
                    closeLayer();
                } else if( 2 == refresh ) {
                    parent.swal('操作成功', '', 'success');
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index);
                    parent.initialize();
                }else{
                    swal('操作成功', '', 'success');
                }
            } else {
                swal('操作失败', '', 'error');
            }
        }
    });
};






// 使用iCheck
var initIcheck = function () {
    $('.wrapper').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
        $(this).removeClass('animated');
    });
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
    });
};

// ajax请求
var ajaxRequest = function (url, data = {}, showError = false, type = "POST", dateType = "json", async = true) {
    $.ajax({
        url: url,   // 请求的url地址
        dataType: dateType,   // 返回格式为json
        async: async, // 请求是否异步，默认为异步，这也是ajax重要特性
        data: data,    // 参数值
        type: type,   //请求方式
        beforeSend: function () { // 请求前的处理
        },
        success: function (cb) { // 请求成功时处理
            if (cb['status'] == 1) {
                swal('获取数据失败', '', 'error');
            } else {
                if (true == showError) {
                    swal('获取数据失败', cb.info, 'error');
                } else {
                    swal('获取数据失败', '', 'error');
                }
            }
        },
        complete: function () { // 请求完成的处理
        },
        error: function () { //请求出错处理

        }
    });
}


// 弹出层表单提交函数
var layuiFrom = function (btnId = "layui-btn-submit", formId = "layuiFrom") {
    $('#' + formId).Validform({
        btnSubmit: '#' + btnId,
        postonce: false,
        showAllError: true,
        //msg：提示信息;
        //o:{obj:*,type:*,curform:*}, obj指向的是当前验证的表单元素（或表单对象），type指示提示的状态，值为1、2、3、4， 1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态, curform为当前form对象;
        //cssctl:内置的提示信息样式控制函数，该函数需传入两个参数：显示提示信息的对象 和 当前提示的状态（既形参o中的type）;
        tiptype: function (msg, o) {
            if (!o.obj.is('form')) {
                //验证表单元素时o.obj为该表单元素，全部验证通过提交表单时o.obj为该表单对象;
                var B = o.obj.parents('.layui-form-item');
                var T = B.find('.help-inline');
                if (o.type == 2) {
                    B.removeClass('has-error').addClass('has-success');
                    T.html("<i class='glyphicon glyphicon-ok'></i> " + "验证通过");
                } else {
                    B.removeClass('has-success').addClass('has-error');
                    T.html("<i class='glyphicon glyphicon-remove'></i> " + msg);
                }
            }
        },
        ajaxPost: true,
        callback: function (cb) {
            if (cb['status'] == 1) {
                parent.swal('操作成功', '', 'success');
                closeLayer();
            } else {
                swal('操作失败', cb['info'], 'error');
            }
        }
    });
}

// layui弹出层
var layuiOpen = function (title = '', area = ['500px', '440px'], content = '', btn = ['确定', '取消'], type = 2, closeBtn = 2, btnAlign = 'r', anim = 6, skin = 'layui-layer-demo') {
    //自定页
    layer.open({
        title: title, // ['消息', 'font-size:18px;'],
        type: type, // 基本层类型  0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
        skin: skin, //样式类名
        shade: [0.8, '#393D49'], // 遮罩
        closeBtn: closeBtn, // 关闭按钮，可通过配置1和2来展示，如果不显示，则closeBtn: 0
        anim: anim, // 弹出动画 0--平滑放大。默认 1--从上掉落 2--从最底部往上滑入 3--从左滑入 4--从左翻滚 5--渐显  6--抖动
        area: area, // 宽高
        content: content,
        // btnAlign: btnAlign,
        // btn: btn,  //可以无限个按钮
        yes: function (index, layero) {
            $res = layero.find("iframe")[0].contentWindow.layuiFormClick();
            alert($res);
        },
        cancel: function (index, layero) {
        },
    });
}

// 核对删除
var checkAndDelete = function (checkUrl = '', checkData = {}, checkTitle = '', checkText = '', url = '', data = {}, title = '您确定要删除吗', text = '删除后将无法恢复，请谨慎操作') {
    $.post(checkUrl, checkData, function (cb) {
        if (cb['status'] == 1) {
            if (true == cb['data']['postCheck']) {
                deleteRecord(url, data, title = checkTitle, text = checkText);
            } else {
                deleteRecord(url, data, title = title, text = text);
            }
        } else {
            swal('操作失败', cb['info'], 'error');
        }
    }, 'json');
}






