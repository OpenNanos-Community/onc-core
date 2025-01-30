ONC.Commands.RegisterCommandConfiguration("ban", {
    description = "This is a regular ban command",
    args = {
        {
            type = "player",
            description = "Target",
            default = 10
        },
        {
            type = "number",
            description = "How many minutes",
            default = 10
        },
        {
            type = "string",
            description = "Reason",
            default = "No reason"
        }
    }
})