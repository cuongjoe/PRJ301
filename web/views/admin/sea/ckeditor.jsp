<%-- 
    Document   : ckeditor
    Created on : Mar 1, 2022, 6:20:28 PM
    Author     : giaki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/assets/css/ckeditor/styles.css">
    </head>
    <style>
        .ck-editor__editable_inline h1{
            font-size: 2em!important;
            display: block!important;
            margin-block-start: 0.67em!important;
            margin-block-end: 0.67em!important;
            margin-inline-start: 0px!important;
            margin-inline-end: 0px!important;
            font-weight: bold!important;
        }

        .ck-editor__editable_inline h2{
            display: block!important;
            font-size: 1.5em!important;
            margin-block-start: 0.83em!important;
            margin-block-end: 0.83em!important;
            margin-inline-start: 0px!important;
            margin-inline-end: 0px!important;
            font-weight: bold!important;
        }

        .ck-editor__editable_inline h3{
            display: block!important;
            font-size: 1.17em!important;
            margin-block-start: 1em!important;
            margin-block-end: 1em!important;
            margin-inline-start: 0px!important;
            margin-inline-end: 0px!important;
            font-weight: bold!important;
        }

        .ck-editor__editable_inline h4{
            display: block!important;
            margin-block-start: 1.33em!important;
            margin-block-end: 1.33em!important;
            margin-inline-start: 0px!important;
            margin-inline-end: 0px!important;
            font-weight: bold!important;
            font-size: 1em!important;
        }

        .ck-editor__editable_inline p{
            font-size: 1.1rem!important;
            font-weight: 500!important;
            color: #3b3a39!important;
        }
    </style>
    <body class="bg-emerald-600">
        <div class="centered w-full">
            <div class="row row-editor w-full">
                <div class="editor-container w-full">
                    <div class="editor w-full"></div>
                </div>
            </div>
        </div>
        <script src="/assets/js/ckeditor/build/ckeditor.js"></script>
        <script>
            let data;
            let new_editor;
            const watchdog = new CKSource.EditorWatchdog();
            window.watchdog = watchdog;

            watchdog.setCreator((element, config) => {
                return CKSource.Editor
                        .create(element, {
                            ...config,
                            ckfinder: {
                                options: {
                                    resourceType: 'Images'
                                },
                                uploadUrl: "<%=request.getContextPath()%>/admin/seas/media/upload"
                            },
                        })
                        .then(editor => {
                            editor.model.document.on('change:data', () => {
                                let content = editor.getData();
                                data = content;
                                $("#content").val(content);
                            })
                            new_editor=editor;
                            return editor;
                        })
            });

            watchdog.setDestructor(editor => {
                return editor.destroy();
            });

            watchdog.on('error', handleError);

            watchdog.create(document.querySelector('.editor'), {
                licenseKey: '',
            }).catch(handleError);

            function handleError(error) {
                console.error('Oops, something went wrong!');
                console.error(error);
            }



        </script>
    </body>
</html>
