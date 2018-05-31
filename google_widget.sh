NAME="google_spreadsheet"
DIR="widgets/$NAME"
PART=$DIR"/$NAME"

mkdir $DIR; [ -d $DIR ] && echo "$DIR fine" || echo "$DIR error"

# create html
HTML=$PART.html
touch $HTML; [ -f $HTLM ] && echo "$HTML fine" || echo "$HTML error"
# create coffee
COFFEE=$PART.coffee
touch $COFFEE; [ -f $COFFEE ] && echo "$COFFEE fine" || echo "$COFFEE error"
# create scss
SCSS=$PART.scss
touch $SCSS; [ -f $SCSS ] && echo "$SCSS fine" || echo "$SCSS error"