import { Controller } from "@hotwired/stimulus";
import { Chart } from "chart.js";

// import { color as colorLib } from 'chart.js/helpers';

export default class extends Controller {
  static values = {
    temp: Array
  };


  connect() {
    const datas = this.tempValue
    console.log(datas)
    console.log(typeof datas)
    const labels = []
    const donnees = []
    datas.forEach((data) => {
      const t = data.split(' ')
      labels.push(t[0])
      donnees.push(t[1])
    });

    new Chart(
      this.element,
      {
        type: 'doughnut',
        data: {
          labels: labels,
          datasets: [
            {
              label: 'Stat',
              data: donnees,
              backgroundColor: [
                'rgb(255, 99, 132)',
                'rgb(54, 162, 235)',
                'rgb(255, 205, 86)'
              ],
              hoverOffset: 4
            }
          ]
        }
      }
    );
  }
}
