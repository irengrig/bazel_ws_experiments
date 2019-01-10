load(":utils.bzl", "copy_file")

def _impl(rctx):
    rctx.file("BUILD", "")
    copy_file(rctx, rctx.attr.file_to_copy)

user = repository_rule(
    implementation = _impl,
    attrs = {
        "file_to_copy": attr.label()
    }
)
