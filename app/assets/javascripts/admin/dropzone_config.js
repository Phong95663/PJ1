$(document).ready(function(){
    $("#image-dropzone").dropzone({
        maxFilesize: 2,
        addRemoveLinks: true,

        success: function(file, response) {
            $(file.previewElement).find('.dz-remove').attr('id', response.id);
            $(file.previewElement).addClass('dz-success');
            $('#product_avatar').append($('<option>', {value:response.id, text:response.image.url.split("/").pop()}));
        },

        removedfile: function(file) {
            var id = $(file.previewTemplate).find('.dz-remove').attr('id');

            $.ajax({
                headers: {
                    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
                },
                type: 'DELETE',
                url: "" + ($("#image-dropzone").attr("action")) + "/" + id,
                success: function(data) {
                    image_id = data.id;
                    $("#product_avatar option[value="+image_id+"]").remove();
                }
            });

            var previewElement;
            return (previewElement = file.previewElement) != null ? (previewElement.parentNode.removeChild(file.previewElement)) : (void 0);
        },

        init: function() {

            var me = this;
						
            $.get($(".edit_product").attr("action") + "/list_image", function(data) {
                $.each(data.images, function(key, value) {
                    if (data.images != undefined && data.images.length > 0) {
                        me.emit("addedfile", value);
                        me.emit("thumbnail", value, value.src);
                        me.emit("complete", value);

                        $(value._removeLink).attr("id", value.id);
                    }
                });
            });


        }
    });
});