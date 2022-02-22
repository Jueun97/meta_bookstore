// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

setTimeout(() => console.log("멈춤"), 2000);

var fiction = document.getElementById("1");
var poetry = document.getElementById("2");
var humanity = document.getElementById("3");
var house = document.getElementById("4");
var health = document.getElementById("5");
var leisure = document.getElementById("6");
var economy = document.getElementById("7");

console.log(fiction.value);
console.log(poetry.value);
console.log(humanity.value);
console.log(house.value);
console.log(health.value);



// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["Fiction", "Poetry", "Humanity", "House", "Health", "Leisure", "Economy"],
    datasets: [{
      data: [fiction.value, poetry.value, humanity.value, house.value, health.value, leisure.value, economy.value],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', "#fff234", "#04d118", "#fc8020", "#cba5fc"],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
