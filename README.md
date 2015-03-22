# HTML Nested Comments

The built in comment function in Atom runs into an issue if your HTML code contains comments that you want to maintain while block commenting larger areas of code. This plugin will temporarily disable the nested comments so that you can bulk comment out blocks of HTML that already contain comments.

```html
<div class="wrapper">
  <div class="main">
    <div class="content">
      <p>Lorem ipsum dolor sit amet.</p>
    </div>
    <!-- /.content -->
  </div>
  <!-- /.main -->
</div>
<!-- /.wrapper -->
```

Each of the existing comment tags will be replaced with `<!~~` or `~~>` respectively when commenting, and then the effect will be reversed when uncommenting.

Run the nest command and the code is transformed into:

```html
<!-- <div class="wrapper">
  <div class="main">
    <div class="content">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis recusandae assumenda consequuntur, incidunt sapiente at quas quam sequi ipsa similique natus laborum et perferendis est, doloremque harum voluptatem totam asperiores!</p>
    </div>
    <!~~ /.content ~~>
  </div>
  <!~~ /.main ~~>
</div>
<!~~ /.wrapper ~~> -->
```

Rerun the command with the commented block selected and it will reverse the nested commenting and bring your code back to it's original state with original comments in place.

Currently the functionality is setup only to work with files that have the following file extensions:

- html
- htm
- php
- asp
- cfm
- md

The file extension limitation can be lifted if it turns out to be more of a nuisance than a feature.
