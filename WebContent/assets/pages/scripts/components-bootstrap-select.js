var ComponentsBootstrapSelect = function () {

    var handleBootstrapSelect = function() {
        $('.bs-select').selectpicker({
            iconBase: 'fa',
            tickIcon: 'fa-check',
            noneSelectedText: '请选择应用系统',
            noneResultsText: '没有结果',
            selectAllText: '全部',
            deselectAllText: '清除'
        });
    }

    return {
        //main function to initiate the module
        init: function () {      
            handleBootstrapSelect();
        }
    };

}();

if (App.isAngularJsApp() === false) {
    jQuery(document).ready(function() {    
        ComponentsBootstrapSelect.init(); 
    });
}