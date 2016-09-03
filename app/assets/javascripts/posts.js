var postsApi = function() {

    function init() {
        bindEvents();
    }

    function bindEvents() {
        $('.btn-post-edit').on('click', didClickOnPostEditButton);
        $('.btn-post-cancel-edit').on('click', didClickOnPostCancelEditButton);
    }

    function didClickOnPostEditButton() {
        var id = $(this).data('id');
        $("div[data-id='" + id + "'] .info form").removeClass('hidden');
    }

    function didClickOnPostCancelEditButton() {
        $(this).closest('form').addClass('hidden');
    }

    return {
        init: init
    }

}();

$(function() {
    postsApi.init();
});