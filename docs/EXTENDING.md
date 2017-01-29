# Extending HTML Nested Comments

To add support for HTML Nested Comments in a new language, two steps are required. The first is to add a key binding for the new language. The second step adds any new file extensions to the list of supported extensions.

Without the key binding, use of <kbd>Ctrl</kbd>+<kbd>/</kbd> will continue to cause default action to take place. Without the addition of the extensions, <kbd>Ctrl</kbd>+<kbd>/</kbd> will do nothing at all.

## Add Key Binding

In your `keymap.cson` file (choose the menu option _File_ > _Keymap..._) you will need to add two lines similar to the following:

```cson
atom-text-editor[data-grammar="GRAMMAR SPEC"]:not([mini])':'ctrl-/': 'html-nested-comments:comment'
```

`GRAMAR SPEC` identifies the grammar of the new language. It can be gotten from two places:

1. Use the language's package definition

  1. Go to the _Settings_ tab (press `Ctrl+Comma` or choose the menu option _File_ > _Settings_).

  1. Click _Packages_ in the navigation pane

  1. Enter the name of the language in the _Filter packages by name_ search line.

  1. Locate the correct package and click the <button type="button" class="btn icon icon-gear settings" style="display: inline; transform: scale(0.9,0.9); margin: 0; padding: 0;">Settings</button> button.

  1. When the settings information expands, look down the display  to find the heading for the language. As of this writing (Atom 1.13.1) there is an image of a puzzle piece to the left of the heading.

  1. Look just under the title for **Scope**.

  1. Use the text after the colon (":"), replacing any periods (".") with spaces ("&nbsp;") as the value for `GRAMMAR SPEC`, above. For example, HTML has a Scope of "text.html.basic". The value to use for `GRAMMAR SPEC` is "text html basic".

1. Use the _Developer Tools_ panel

  1. Make sure there is a tab open to edit a file in the language you are interested in. The tab can be empty, but it must be named with the language's file extension.

  1. Open the panel (press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>I</kbd> or choose the menu option _View_ > _Developer_ > _Toggle Developer Tools_)

  1. Click the icon to select and element for inspection (top left corner of the _Developer Tools_ panel).

  1. Click on the content part of the tab opened, or identified, in the first step above.

  1. In the _Elements_ tab of the _Developer Tools_ panel, search up the markup until a `<atom-text-editor>` tag is encountered. The `data-grammar` attribute is the value to use for `GRAMMAR SPEC`. For example, for HTML the element of interest would look something like

        ```html
        <atom-text-editor class="editor" tabindex="-1" data-grammar="text html basic" data-encoding="utf8" with-minimap="">`
        ```

## Add file extensions

1. You'll Find the html-nested-comments library directory:

  * For MacOS and Linux

    <pre>~/.atom/packages/html-nested-comments/lib/html-nested-comments.coffee</pre>
  * For Windows

    <pre>%USERPROFILE%\.atom\packages\html-nested-comments\lib\html-nested-comments.coffee</pre>

1. Look for the lines

    ```coffeescript
    # File extensions that will use this type of commenting
    extensions = [
      'html',
      'htm',
      'php',
      .
      .
      .
    ]
    ```

1. Add a new line for each extension to be supported. Ensure the indentation is the same as the existing lines. The last item in the array can not include a comma at the end!
1. Save and close the file.
