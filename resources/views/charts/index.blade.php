<div class="chart-wrap">
    <p class="block-title left">{{ $chart->getTranslatedAttribute('title') }}</p>
    <p class="subtitle">{{ $chart->getTranslatedAttribute('sub_title') }}</p>
{{--  data type = line, pie, bar chart  --}}
    <div data-tools='{
            "type": "{{ $chart->type->js_type }}",
            "min": {{ $chart->min_number }},
            "max": {{ $chart->max_number }} }'
         class="chart-item">
        <script type="application/json">
        {!! $chart->data_json !!}
        </script>
        <canvas></canvas>
    </div>

    @if($withLink)
        <div class="btn-wrap">
            <a href="{{ url('statistika') }}" class="more">@lang('main.more-statistics')</a>
        </div>
    @endif
</div>
