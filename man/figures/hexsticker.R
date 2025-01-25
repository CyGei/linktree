
library(R6)
library(ggplot2)
library(uuid)
options(stringsAsFactors = FALSE)

branch_base = R6Class('branch_base',
                      public = list(
                        start_x = NA_integer_,
                        start_y = NA_integer_,
                        end_x = NA_integer_,
                        end_y = NA_integer_,
                        type = NA_character_,
                        id = NA_character_,
                        branch_color = NA_character_
                      ),  # public

                      active = list(
                        df = function() {
                          x = c(self$start_x, self$end_x)
                          y = c(self$start_y, self$end_y)

                          data.frame(x = x, y = y,
                                     type = self$type,
                                     id = self$id,
                                     branch_color = self$branch_color)
                        }
                      )  # active
)  # branch_base

trunk = R6Class('trunk',
                inherit = branch_base,
                public = list(
                  initialize = function(len = 10, branch_color = '#000000') {
                    self$start_x = 0
                    self$start_y = 0
                    self$end_x = 0
                    self$end_y = len
                    self$type = 'trunk'
                    self$branch_color = branch_color

                    self$id = uuid::UUIDgenerate()
                  }
                )  # public
)  # trunk

branch = R6Class('branch',
                 inherit = branch_base,
                 public = list(
                   initialize = function(x, y, len = 5, theta = 60,
                                         type = NA_character_, branch_color='#000000') {  # Adjusted angle to 60 for hexagonal structure
                     dy = sin(theta) * len
                     dx = cos(theta) * len

                     self$start_x = x
                     self$start_y = y
                     self$end_x = x + dx
                     self$end_y = y + dy

                     self$type = type
                     self$id = uuid::UUIDgenerate()
                     self$branch_color = branch_color
                   }
                 )  # public
)  # branch

fractal_tree = R6Class('fractal_tree',
                       public = list(
                         delta_angle = NA_real_,
                         len_decay = NA_real_,
                         min_len = NA_real_,
                         branches = data.frame(),
                         branch_left_color = NA_character_,
                         branch_right_color = NA_character_,

                         initialize = function(trunk_len = 10,
                                               delta_angle = pi / 6,  # Adjusted to create hexagonal pattern
                                               len_decay = 0.7,
                                               min_len = 0.25,
                                               trunk_color = '#000000',
                                               branch_left_color = '#000000',
                                               branch_right_color = '#adadad') {
                           self$delta_angle = delta_angle
                           self$len_decay = len_decay
                           self$min_len = min_len
                           self$branch_left_color = branch_left_color
                           self$branch_right_color = branch_right_color

                           self$branches = trunk$new(trunk_len, trunk_color)$df

                           private$grow_branches(0, trunk_len,
                                                 len = trunk_len * len_decay,
                                                 angle_in = pi / 2)
                         },  # initialize

                         plot = function() {
                           # Assign colours based on closest branch
                           closest_node_colors = self$get_node_colours()

                           ggplot(self$branches, aes(x, y, group = id, color = closest_node_colors)) +
                             geom_line() +
                             geom_point(size=0.5) +
                             scale_color_identity() +
                             guides(color = FALSE, linetype = FALSE) +
                             theme_void()
                             # theme( panel.background = element_rect(
                             #   fill = "black", colour = "black"),
                             #        plot.margin = unit(c(0, 0, 0, 0), "cm"))
                         },

                         get_node_colours = function() {
                           # Cluster nodes into 6 closest groups
                           set.seed(42)
                           node_coords = self$branches[, c("x", "y")]
                           dist_matrix = as.matrix(dist(node_coords))

                           # Assign each node to the nearest node and colour based on group
                           cluster_colors = rep(NA, nrow(dist_matrix))
                           color_palette = c('purple', 'grey', 'steelblue', 'pink')

                           for (i in 1:nrow(dist_matrix)) {
                             nearest_node = which.min(dist_matrix[i, -i])  # Find nearest neighbour
                             cluster_colors[i] = color_palette[nearest_node %% length(color_palette) + 1]
                           }

                           return(cluster_colors)
                         }
                       ), # public

                       private = list(
                         grow_branches = function(start_x, start_y,
                                                  len = 1,
                                                  angle_in = pi / 2,
                                                  parent_type = NA,
                                                  parent_color = NA) {
                           if (len >= self$min_len) {
                             l_type = if (!is.na(parent_type)) parent_type else 'left'
                             r_type = if (!is.na(parent_type)) parent_type else 'right'
                             l_color = if (!is.na(parent_color)) parent_color else self$branch_left_color
                             r_color = if (!is.na(parent_color)) parent_color else self$branch_right_color

                             branch_left  = branch$new(start_x, start_y, len, angle_in + self$delta_angle, l_type, l_color)
                             branch_right = branch$new(start_x, start_y, len, angle_in - self$delta_angle, r_type, r_color)

                             self$branches = rbind(self$branches, branch_left$df, branch_right$df)

                             private$grow_branches(branch_left$end_x,
                                                   branch_left$end_y,
                                                   angle_in = angle_in + self$delta_angle,
                                                   len = len * self$len_decay,
                                                   parent_type = branch_left$type,
                                                   parent_color = branch_left$branch_color)

                             private$grow_branches(branch_right$end_x,
                                                   branch_right$end_y,
                                                   angle_in = angle_in - self$delta_angle,
                                                   len = len * self$len_decay,
                                                   parent_type =  branch_right$type,
                                                   parent_color = branch_right$branch_color)
                           }
                         }  # grow_branches
                       )  # private
)  # fractal_tree

# Create & plot R6 tree object with new angle
tree = fractal_tree$new()
library(hexSticker)

sticker(
  tree$plot(),
  package = "linktree",
  s_width  = 1,
  s_height = 1,
  s_x      = 1,
  s_y      = 0.75,
  p_color  = "white",
  p_size   = 30,
  h_fill   = "black",
  h_color  = "white",
  url      = "github.com/CyGei/linktree",
  u_color  = "white",
  u_size   = 6,
  filename = "man/figures/hexsticker.png"
)
