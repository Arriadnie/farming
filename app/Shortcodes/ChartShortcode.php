<?php

namespace App\Shortcodes;

use App\Models\Charts\Chart;

class ChartShortcode
{
    public function register($shortcode, $content, $compiler, $name, $viewData)
    {
        $chart = Chart::findBySlug($shortcode->code);

        if (!$chart) {
            return '';
        }
        return view('charts/index', [
            'chart' => $chart,
            'withLink' => $shortcode->withlink == "true"
        ]);
    }
}
