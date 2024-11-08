static kk_std_core_exn__error kk_compro_os_input_error(kk_context_t* ctx) {
    char* buf;
    int s = 32;
    if (!(buf = (char*)malloc(sizeof(char) * s))) return kk_error_from_errno(errno, ctx);
    if (fgets(buf, s - 1, stdin) == NULL) return kk_error_from_errno(errno, ctx);
    buf[s - 1] = 0;
    size_t len = strlen(buf);
    if (len <= 0)
        ;
    else if (len > 0 && buf[len - 1] == '\n') {
        buf[len - 1] = 0;
    } else {
        while (1) {
            char* tmp;
            if (!(tmp = (char*)malloc(sizeof(char) * s * 2))) return kk_error_from_errno(errno, ctx);
            memcpy(tmp, buf, sizeof(char) * len);
            free(buf);
            if (fgets(tmp + len, 2 * s - len - 1, stdin) == NULL) return kk_error_from_errno(errno, ctx);
            tmp[2 * s - 1] = 0;
            buf = tmp;
            len = strlen(buf);
            if (len <= 0) break;
            if (buf[len - 1] == '\n') {
                buf[len - 1] = 0;
                break;
            }
            s *= 2;
        }
    }
    kk_string_t content = kk_string_alloc_from_qutf8(buf, ctx);
    return kk_error_ok(kk_string_box(content), ctx);
}
