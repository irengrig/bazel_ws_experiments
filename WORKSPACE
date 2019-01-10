workspace(name = "experiment")

load(":generator.bzl", "generator")

generator(name = "g8")

load("@g8//:ws_macro.bzl", "call_me_from_ws")

call_me_from_ws("u2")
