/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
new WOW().init();
$('#fixednav ul li a').click(function () {
    $('#fixednav ul li a').removeClass('active');
    $(this).addClass('active');
});

