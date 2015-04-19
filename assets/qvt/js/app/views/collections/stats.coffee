define ['marionette','cs!app/views/layouts/eachstat'],(Marionette,StatLayout) ->
  class NoStatView extends Marionette.ItemView
    template : '<strong> No stats found. </strong>'
  class StatsLayout extends Marionette.CollectionView
    tagName :  'ul'
    #className : 'dashboard-list'
    itemView: StatLayout
    emptyView : NoStatView
