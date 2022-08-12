  'use strict';

document.addEventListener("DOMContentLoaded", function(){
  const date = new Date();

  const prevBtn = document.querySelector(".prev");
  const nextBtn = document.querySelector(".next");

  const renderCalendar = function() {

    date.setDate(1);

    const monthDays = document.querySelector('.days');

    const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0).getDate();

    const prevLastDay = new Date(date.getFullYear(), date.getMonth(), 0).getDate();
    //前の月の最終日を取得する

    const firstDayIndex = date.getDay();
    //firstDayIndex = 0 means that first day of this month is on Monday

    const lastDayIndex = new Date(date.getFullYear(), date.getMonth() + 1, 0).getDay();
    // lastDayIndex = 3 means that last day of this month is on Wednesday.

    const nextDays = 7 - lastDayIndex - 1;
    // 今月の最終日の曜日の位置を取得するlastDayIndexから７を引き、
    //１を引くと次の月の最初の週の日付（今月分に表示する）の数を取得できる

    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "Decempber",
      ]

    document.querySelector('.date h1').innerHTML
    = months[date.getMonth()];
    //date.getMonth() 現在の月を取得する

    document.querySelector('.date p').innerHTML
    = date.toDateString();
    //date.toDateString 現在の年月日曜日を英語で空白区切りで取得する

    let days = "";

    for(let x = firstDayIndex; x > 0; x--){
      // 今月のカレンダーに、前の月の最終週の日付を追加したい
      // 最終週の日にちの数は、今月の1日がどの曜日に位置するかで取得することができる
      // prevLastDay（7月31日）からfirstDayIndex（１=月曜日）を引き、
      // 取得できる値（３０）にfirstDayIndex（１）を足すことで、前の月の最終週の日付を取得することができる
      days += `<div class="prev-date ${prevLastDay - x + 1}">${prevLastDay - x + 1}</div>`
      // days（今月の日付）に足す
    }

    for (let i = 1; i <= lastDay; i++) {
      if(i === new Date().getDate() && date.getMonth() === new Date().getMonth()) {
        days += `<div class="today this-days ${i}">${i}</div>`;
      } else {
        days += `<div class="this-days" id="this-days--${i}">${i}</div>`;
      }
    }

    for (let j = 1; j <= nextDays; j++) {
      days += `<div class="next-date ${j}">${j}</div>`
    }
    monthDays.innerHTML = days;

  };

  //前の月のカレンダーを表示する
  prevBtn.addEventListener('click', function() {
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
  });
　 //次の月のカレンダーを表示する
  nextBtn.addEventListener('click', function() {
    date.setMonth(date.getMonth() + 1);
    renderCalendar();
  });

  renderCalendar();
})


