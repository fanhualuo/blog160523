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

    //�������Ƿ���Ա�����
    config.toolbarCanCollapse = true;

    //��������λ��
    config.toolbarLocation = 'top';//��ѡ��bottom

    //������Ĭ���Ƿ�չ��
    config.toolbarStartupExpanded = true;

    // ���ÿ��
    config.width = 700;

    config.height = 450;

    
    //���ô���������
    config.extraPlugins = 'clipboard,lineutils,widget,dialog,codesnippet'; 

    //���ô����ı���Ϊ��ɫ
    config.codeSnippet_theme = 'monokai_sublime';


};
