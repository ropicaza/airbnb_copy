import flatpickr from "flatpickr";
import 'flatpickr/dist/themes/airbnb.css'
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const initflatpickr = () => {
  flatpickr("#range_start", {
    altInput: true,
    minDate: "today",
    plugins: [new rangePlugin({ input: "#range_end"})]
  });
}

export { initflatpickr };

