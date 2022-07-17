<template>
  <v-dialog v-model="isDialogOpen" max-width="500px">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="primary" dark class="mb-2" v-bind="attrs" v-on="on">
        New Customer
      </v-btn>
    </template>
    <v-card>
      <v-card-title>
        <span class="text-h5">New Customer</span>
      </v-card-title>

      <v-card-text>
        <v-container>
          <v-col>
            <v-row>
              <v-text-field
                v-model="currentUser.first_name"
                label="First Name"
              ></v-text-field>
            </v-row>
            <v-row>
              <v-text-field
                v-model="currentUser.last_name"
                label="Last Name"
              ></v-text-field>
            </v-row>
            <v-row>
              <v-text-field
                v-model="currentUser.state"
                label="State"
              ></v-text-field>
            </v-row>
            <v-row>
              <v-text-field
                v-model="currentUser.country"
                label="Country"
              ></v-text-field>
            </v-row>
          </v-col>
        </v-container>
      </v-card-text>

      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="blue darken-1" text @click="close"> Cancel </v-btn>
        <v-btn color="blue darken-1" text @click="save"> Save </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script lang="ts">
import Vue from "vue";
import Component from "vue-class-component";
import { Prop } from "vue-property-decorator";
import CustomerType from "../types/user";

@Component
export default class NewUserDialog extends Vue {
  @Prop() userData!: CustomerType;

  @Prop() onSubmit: (value: CustomerType) => void;

  isDialogOpen = false;

  currentUser = this.userData || {
    first_name: "",
    last_name: "",
    state: "",
    country: "",
  };

  close() {
    console.log(this.userData);
    this.isDialogOpen = false;
  }

  save() {
    console.log("saved with", this.currentUser);
    this.$emit("submit", this.currentUser);
  }
}
</script>

<style></style>
