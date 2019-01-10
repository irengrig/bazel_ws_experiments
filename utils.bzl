def copy_file(rctx, src):
    src_path = rctx.path(src)
    copy_path = src_path.basename
    rctx.template(copy_path, src_path)
    return copy_path
