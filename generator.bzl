load(":utils.bzl", "copy_file")

def _impl(rctx):
    rctx.file("BUILD", "")
    rctx.file("just_copy_me.bzl", "TEST=1")
    copy_file(rctx, rctx.attr._utils)
    copy_file(rctx, rctx.attr._user)
    rctx.file("ws_macro.bzl", """
load(":user.bzl", "user")

def call_me_from_ws(name_):
    print("TRACE")
    user(name = name_, file_to_copy = "@g8//:just_copy_me.bzl")
""")

generator = repository_rule(
    implementation = _impl,
    attrs = {
        "_user": attr.label(
            default = "@experiment//:user.bzl",
        ),
        "_utils": attr.label(
            default = "@experiment//:utils.bzl",
        ),
    },
)
