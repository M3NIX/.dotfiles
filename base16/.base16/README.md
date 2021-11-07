# setup

```
cd ~/.base16
python3 -m pip install --user pybase16-builder
pybase16 update
pybase16 build
./base16-update.sh <theme>
```

as stated in `https://github.com/InspectorMustache/base16-builder-python` every config file needs a marker block
```
# %%base16_template: TEMPLATE_NAME##SUBTEMPLATE_NAME %%

Everything in-between these two lines will be replaced with the colorscheme.

# %%base16_template_end%%
```
