# HTML Nested Comments

The built in comment function in Atom runs into an issue if your HTML code contains comments that you want to maintain while block commenting larger areas of code. This plugin will temporarily disable the nested comments so that you can bulk comment out blocks of HTML that already contain comments.

![example image](http://cdn.philsinatra.com/libraries/atom/html-nested-comments/atom-nested-comments.gif)

The default keybinding is set to <kbd>ctrl</kbd> + <kbd>/</kbd>.

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
      <p>Lorem ipsum dolor sit amet.</p>
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
- xml
- svg

To add support for additional file extensions, see the [EXTENDING](doc/EXTENDING.md) document for more information.
