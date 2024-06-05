#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

typedef struct context {
    struct xdp_md *ctx;
} context_t;

static int do_check(__u32 index, context_t *search_ctx)
{
    __u8 *data = (__u8 *)(long)search_ctx->ctx->data;
    __u8 *data_end = (__u8 *)(long)search_ctx->ctx->data_end;
    __u8 *this_byte;

    if (index > 0 && index <= 100)
    {        
        this_byte = data + index;

        // When run with this change it will pass verification
        this_byte = data + 100;
        
        if (this_byte >= data && this_byte < data_end) 
        {
            if (*this_byte == 123)
            {
                return 1;
            }
        }
    }
    return 0;
}

SEC("xdp")
int  xdp_parser_func(struct xdp_md *ctx)
{
    context_t search_ctx = (context_t) 
    { 
        .ctx = ctx
    };
    
    bpf_loop(1, do_check, &search_ctx, 0);
    return XDP_PASS;
}