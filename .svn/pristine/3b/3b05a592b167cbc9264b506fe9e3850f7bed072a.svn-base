var ComponentsDateTimePickers = function () {
     if (jQuery().datepicker) {
        $('.date-picker').datepicker({
            rtl: App.isRTL(),
            orientation: "left",
            autoclose: true
        });
        //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
    }
    var handleDateRangePickers = function () {
        if (!jQuery().daterangepicker) {
            return;
        }
        $('#reportrange').daterangepicker({
                opens: (App.isRTL() ? 'left' : 'right'),
                startDate: moment().subtract('days', 29),
                endDate: moment(),
                //minDate: '01/01/2012',
                //maxDate: '12/31/2020',
                dateLimit: {
                    days: 400
                },
                showDropdowns: true,
                showWeekNumbers: true,
                timePickerIncrement: 1,
                ranges: {
                    '过去30天': [moment().subtract("days",30),moment()],
                    '过去60天': [moment().subtract("days",59),moment()],
                    '过去90天': [moment().subtract("days",89),moment()]
                    
                },
                buttonClasses: ['btn'],
                applyClass: 'green',
                cancelClass: 'default',
                format: 'YYYY/MM/DD',
                separator: ' to ',
                locale: {
                    applyLabel: '确定',
                    fromLabel: 'From',
                    toLabel: 'To',
                    customRangeLabel: '自定义时间',
                    cancelLabel: '退出',
                    daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                    monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                    firstDay: 1
                }
            },
            function (start, end) {
                console.log(typeof start );
                $('#reportrange span').html(start.format('YYYY/MM/DD') + ' - ' + end.format('YYYY/MM/DD'));                    
            }
        );
        //Set the initial state of the picker label
        $('#reportrange span').html("选择时间范围")
    }

    return {
        //main function to initiate the module
        init: function () {
            
           
            handleDateRangePickers();
        }
    };

}();

if (App.isAngularJsApp() === false) { 
    jQuery(document).ready(function() {    
        ComponentsDateTimePickers.init(); 
    });
}