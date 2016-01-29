<app>
  <nav>
      <ul>
          <li each={ data }><a href="#{ id }">{ title }</a></li>
      </ul>
  </nav>

  <article>
    <h1>{ page.title || 'Not found' }</h1>
    <div id="content">{ page.body || 'Specified id is not found.' }</div>
  </article>

  <script>
    var self = this
    self.data = [
      { id: "data-analysis", title: "Data Analysis", body: "data-analysis" },
      { id: "today-weather", title: "Today's Weather", body: "today-weather" }
    ]
    self.page = self.data[0]

    riot.route(function(id) {
      self.page = self.data.filter(function(r) { return r.id == id })[0] || {}
      riot.mount('div#content',self.page.body)
      self.update()
    })
  </script>

  <style scoped>
    :scope {
      display: block;
      font-family: sans-serif;
      margin: 0;
    }
    nav {
      position: absolute;
      left: 0px;
      width: 20%;
    }
    nav > ul {
      font-size: 12px;
      list-style: none;
      margin: 5px;
      padding: 0;
    }
    nav li {
      padding: 5px 20px;
      border: 1px solid #c0c0c0;
      border-bottom: none;
      *border-bottom: 1px solid #c0c0c0;/* IE CSS hack*/
    }
    nav li:last-child {
      border-bottom: 1px solid #c0c0c0;
    }
    nav li a{
      text-decoration: none;
    }
    nav li:hover {
      font-weight: bold;
      cursor: pointer;
      border: 1px solid #2a9fcd;
      background-color: #E7EBFF
    }

    h1 {
      margin: 0 0 10px;
      padding: 15px 5px 4px;
      font-size: 16px;
      font-family: Arial;
      border-bottom: 1px solid #000;
    }

    article {
      margin-left: 20%;
      padding: 5px;
    }

    @media (max-width:719px) {
      nav {
        position: relative;
        width: 100%;
      }
      article {
        margin-left: 0;
      }
    }

  </style>
</app>
