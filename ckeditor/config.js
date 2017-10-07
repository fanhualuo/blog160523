/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {

    
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    // config.uiColor = '#AADC6E';

    config.language = 'zh-cn';

    config.filebrowserImageUploadUrl = "/Handler/UploadCkeditorImage.ashx";

    //工具栏是否可以被收缩
    config.toolbarCanCollapse = true;

    //工具栏的位置
    config.toolbarLocation = 'top';//可选：bottom

    //工具栏默认是否展开
    config.toolbarStartupExpanded = true;

    // 设置宽高
    config.width = 700;

    config.height = 450;

    
    //设置代码块的属性
    config.extraPlugins = 'clipboard,lineutils,widget,dialog,codesnippet'; 

    //设置代码块的背景为黑色
    config.codeSnippet_theme = 'monokai_sublime';


};
