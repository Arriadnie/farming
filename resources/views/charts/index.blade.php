<div class="chart-wrap">

    <p class="block-title left">Статистика</p>
    <p class="subtitle">Статистика удоя молока Крым-Фарминг</p>
{{--  data type = line, pie, bar chart  --}}
    <div data-tools='{
            "type": "line",
            "min": 32,
            "max": 35 }'
         class="chart-item">
        <script type="application/json">
        {
            "labels": ["Январь", "Февраль", "Март", "Апрель", "Июнь", "Июль"],
            "datasets": [{
                "label": "Литров молока на корову в сутки",
                "data": [33.3, 33.6, 33, 34.5, 34, 34.3],
                "backgroundColor": [
                    "rgba(75, 192, 192, 0.2)",
                    "rgba(255, 99, 132, 0.2)",
                    "rgba(54, 162, 235, 0.2)",
                    "rgba(255, 206, 86, 0.2)",
                    "rgba(153, 102, 255, 0.2)",
                    "rgba(255, 159, 64, 0.2)"
                ],
                "borderColor": [
                    "rgba(75, 192, 192, 1)",
                    "rgba(255, 99, 132, 1)",
                    "rgba(54, 162, 235, 1)",
                    "rgba(255, 206, 86, 1)",
                    "rgba(153, 102, 255, 1)",
                    "rgba(255, 159, 64, 1)"
                ],
                "borderWidth": 1
            }]
        }

        </script>
        <canvas></canvas>
    </div>

    <div class="btn-wrap">
        <a href="#" class="more">Больше статистики</a>
    </div>

</div>
