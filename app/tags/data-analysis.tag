<data-analysis>
  <div class="vis-wrapper">
    <div id="visualization"></div>
  </div>
  <form onsubmit="{ updataChart }" action="#">
    <textarea id="data-text" cols="30" rows="10" onkeyup="{ updataChart }">{ text }</textarea>
    <button type="submit">Submit</button>
  </form>

  <script>
  this.text =
    "Year,Men,Female\n"+
    "2007,106898,97516\n"+
    "2008,103937,94796\n"+
    "2009,99492,91818\n"+
    "2010,87213,79673\n"+
    "2011,101943,94684\n"+
    "2012,118848,110633\n"+
    "2013,103120,95993"

    updataChart(e) {
      this.text = e.target.value
      this.g.updateOptions( { 'file': this.text } )
    }

    this.on('mount', function() {
      this.g = new Dygraph(
        document.getElementById('visualization'),this.text
      );
    })
  </script>

  <style scoped>
    .vis-wrapper {
      position: relative;
      width: 100%;
      height: 360px;
    }

    #visualization {
      position: absolute;
      left: 10px; right: 30px; top: 10px; bottom: 10px;
    }
  </style>
</data-analysis>
