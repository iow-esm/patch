# Purpose, Description

This is a tool for creating patches for non-open-source code within the IOW ESM.
The encrypting mechanism is based on the `diff` and `patch` tool provided by Linux.
The patching of the sources enables publishing modified parts of the model code without making it useful for everyone.
Those who may have access to the code may get the corresponding original sources and are able to view the code and build it.
The patching happens then automatically during the build process.


# Authors

* SK      (sven.karsten@io-warnemuende.de)


# Versions

## 1.00.00 (latest release)

| date        | author(s)   | link      |
|---          |---          |---        |
| 2022-07-25  | SK          | [1.00.00](https://git.io-warnemuende.de/iow_esm/encrypt/src/branch/1.00.00)      | 

<details>

### changes
* Initial release
    
### dependencies
* the Linux tools `diff` and `patch` must be installed (comes with most Linux distributions) 
  
### known issues
* None

### tested with
* -

</details>

<details>
<summary><b><i>older versions</i></b></summary>


</details>

# Usage

## Creating a patch

A patch is created by first changing to the directory where the original file/directory and the modified one is located, and second, by executing the script

```bash
/path/to/patch/create_patch.sh <original> <modified>
```

This script creates a `<object>.patch` file having the name of the patched object, i.e. a file or a directory.


## Merging the patch with the original sources

The modified sources can be recovered from the patch and the original sources with the command
```bash
/path/to/patch/merge_patch.sh <original> <patch> <modified>
```

where `<original>` is the path to the original source (can also be a tar archive, but the argmuent must be without the ending!), `<patch>` is the path to the patch file and the file/directory `<modified>` should be created.
The keyword `<modified>` must not be arbitrary but has to be contained in the `<original>`!