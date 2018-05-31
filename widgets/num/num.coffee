class Dashing.Num extends Dashing.Widget
    @accessor 'num', Dashing.AnimatedValue
    @accessor 'num10', ->
        num10 = @get('num') * 10
        "#{num10}"
